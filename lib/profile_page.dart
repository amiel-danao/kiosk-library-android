import 'package:flutter/material.dart';
import 'package:ncst_kiosk_library/widgets/side_drawer_widget.dart';
import 'models/student.dart';

class ProfilePageWidget extends StatefulWidget {
  final Student student;

  const ProfilePageWidget({Key? key, required this.student}) : super(key: key);

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidget();
}

class _ProfilePageWidget extends State<ProfilePageWidget> {
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
      endDrawer:
      SideDrawerWidget(student: widget.student,),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Container(
                            child: ClipOval(
                          child: Image.asset(
                            width: 160,
                            height: 160,
                            'assets/img.jpg',
                            fit: BoxFit.fill,
                          ),
                        )),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color: Color(0xFF0329CC),
                                border:
                                    Border.all(width: 3, color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(80))),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                'Juan Delacruz',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFEEEF08),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: 200,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(width: 3, color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    'BSIT-11E1',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 350,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(width: 3, color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Student Caption:\n\ \n\Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ac odio in nisi eleifend placerat. Curabitur sapien lorem, ornare ac pellentesque ac, pharetra ut turpis. Suspendisse tempor sapien lorem, nec tempus massa condimentum eu. Donec sodales nibh id velit sollicitudin, vel semper sem semper.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
