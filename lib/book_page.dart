import 'package:flutter/material.dart';
import 'package:ncst_kiosk_library/search_book.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncst_kiosk_library/widgets/side_drawer_widget.dart';
import 'login_page.dart';
import 'models/student.dart';

class BookPageWidget extends StatefulWidget {
  final Student student;

  const BookPageWidget({Key? key, required this.student}) : super(key: key);

  @override
  State<BookPageWidget> createState() => _BookPageWidget();
}

class _BookPageWidget extends State<BookPageWidget> {
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
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            border: Border.all(
                              color: Colors.blue.shade900,
                              width: 7.0,
                            )),
                        child: Container(
                            color: Colors.white, child: DataTableWidget()),

                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<Map<String, String>> listOfColumns = [
    {
      "Title": "The Very Hungry Caterpillar",
      "Date Borrowed": "02/13/2022",
      "Return Date": "03/13/2022"
    },
    {
      "Title": "Introduction to Neuroscience",
      "Date Borrowed": "05/22/2022",
      "Return Date": "06/22/2022"
    },
    {
      "Title": "Technical Writing and Simple Statistics",
      "Date Borrowed": "06/12/2022",
      "Return Date": "06/19/2022"
    }
  ];
//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
            label: Text(
          'Title',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontFamily: 'Solitreo',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        )),
        DataColumn(
            label: Text('Date Borrowed',
                style: TextStyle(
                  color: Colors.blue.shade800,
                  fontFamily: 'Solitreo',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ))),
        DataColumn(
            label: Text(
          'Return',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue.shade800,
            fontFamily: 'Roboto Condensed',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        )),
      ],
      rows:
          listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          element["Title"]!,
                          style: TextStyle(
                            fontFamily: 'Solitreo',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )), //Extracting from Map element the value
                        DataCell(
                          Text(
                            element["Date Borrowed"]!,
                            style: TextStyle(
                              fontFamily: 'Solitreo',
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          element["Return Date"]!,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue.shade800,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )),
                      ],
                    )),
              )
              .toList(),
    );
  }
}