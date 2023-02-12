import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ncst_kiosk_library/models/token_response.dart';
import 'package:ncst_kiosk_library/search_book.dart';
import 'package:ncst_kiosk_library/utils/environment.dart';
import 'package:ncst_kiosk_library/widgets/loading.dart';
import 'package:simple_logger/simple_logger.dart';

import 'controller/student_controller.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final logger = SimpleLogger();
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController(text: Environment.debugEmail);
  final passwordController = TextEditingController(text: Environment.debugPassword);

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0329CC),
        automaticallyImplyLeading: false,
        leading: Image.network(
          'https://pbs.twimg.com/profile_images/1227140400877453318/y7lBi1Gd_400x400.jpg',
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        title: const Text(
          'NCST',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFFEEEF08),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child:
              SingleChildScrollView(
                child:
              Form(
              key: _formKey,
              child:
               SizedBox(
                  child:
                  Wrap(
                    children: [
                      Center(
                        child:
                        SizedBox(
                          child:
                          Padding(
                            padding: const EdgeInsets.all(60.0),

                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(40),
                                    child: Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/8/88/NCST-MAIN_LOGO.png',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: validateEmail,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Student Email",
                                    ),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),

                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Password",
                                    ),
                                    validator: (String? value) {
                                      if (value!.trim().isEmpty) {
                                        return 'Password is required';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: SizedBox(
                                          width: 120,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (!isLoading) {
                                                // Validate returns true if the form is valid, or false otherwise.
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  setState(() {
                                                    isLoading = true;
                                                  });
                                                  var response = await beginLogin(context, emailController.value.text, passwordController.value.text);
                                                  logger.info('response code : ${response.statusCode}');
                                                  logger.info(response.body);

                                                  if (response.statusCode == 200){
                                                      var tokenResponse = TokenResponse.fromJson(json.decode(response.body));
                                                      var student = await fetchStudentFromToken(tokenResponse);
                                                      if(mounted) {
                                                        if (student == null){
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                                content: Text('Failed to get student data,\nTry again later.')),
                                                          );
                                                          setState(() {
                                                            isLoading = false;
                                                          });
                                                          return;
                                                        }

                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (
                                                                  context) => SearchBookWidget(student: student)),
                                                          );
                                                        }else{
                                                          logger.info('Not mounted!');
                                                        }
                                                  }
                                                  else{
                                                    logger.info(response.body);
                                                    if(mounted){
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(response.body)),
                                                    );}
                                                  }
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                }
                                              }
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(0xFF0329CC)),
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        side: const BorderSide(
                                                            color: Color(
                                                                0xFFEEEF08),
                                                            width: 2))),
                                                textStyle:
                                                    MaterialStateProperty.all(
                                                        const TextStyle(
                                                            color: Colors.white))),
                                            child: const Text('Login'),
                                          ),
                                        ),
                                      ),
                                      /*
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: SizedBox(
                                          width: 120,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Perform some action
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Not yet implemented!')),
                                              );
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(0xFF0329CC)),
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        side: const BorderSide(
                                                            color: Color(
                                                                0xFFEEEF08),
                                                            width: 2))),
                                                textStyle:
                                                    MaterialStateProperty.all(
                                                        const TextStyle(
                                                            color: Colors.white))),
                                            child: const Text('Register'),
                                          ),
                                        ),
                                      ),
                                    */
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              )

              ),
            ),
          ),

          (isLoading)?
              circularProgress()
              : const SizedBox.shrink()
        ],
      ),
    );
  }



  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty || regex.hasMatch(value)
        ? null
        : 'Enter a valid email address';
  }


}
