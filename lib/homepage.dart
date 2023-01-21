import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'profilepage.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0329CC),
        automaticallyImplyLeading: false,
        leading: Image.network(
          'https://pbs.twimg.com/profile_images/1227140400877453318/y7lBi1Gd_400x400.jpg',
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        title: Text(
          'NCST',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFFEEEF08),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Wrap(
                    children: [
                      Container(
                        child: Center(
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(60.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(40),
                                      child: Container(
                                          child: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/8/88/NCST-MAIN_LOGO.png',
                                      )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Username/Student Name",
                                        ),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Password",
                                        ),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
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
                                              onPressed: () {
                                                // Perform some action
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ProfilePageWidget()),
                                                );
                                              },
                                              child: Text('Login'),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFF0329CC)),
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xFFEEEF08),
                                                              width: 2))),
                                                  textStyle:
                                                      MaterialStateProperty.all(
                                                          TextStyle(
                                                              color: Colors.white))),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: SizedBox(
                                            width: 120,
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Perform some action
                                              },
                                              child: Text('Register'),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFF0329CC)),
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xFFEEEF08),
                                                              width: 2))),
                                                  textStyle:
                                                      MaterialStateProperty.all(
                                                          TextStyle(
                                                              color: Colors.white))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
