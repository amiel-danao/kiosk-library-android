import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_flowjabol/searchbook.dart';
=======
>>>>>>> a1066918a6d8395b9d8436db18a43594e18d9ac7
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'homepage.dart';

class BookPageWidget extends StatefulWidget {
  const BookPageWidget({Key? key}) : super(key: key);

  @override
  _BookPageWidget createState() => _BookPageWidget();
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
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xFF0329CC),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1227140400877453318/y7lBi1Gd_400x400.jpg'),
                    fit: BoxFit.fitHeight,
                  )),
              child: Text(''),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Login Page'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageWidget()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book_outlined,
              ),
              title: const Text('Borrowed Books'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
              ),
              title: const Text('Search for books'),
              onTap: () {
<<<<<<< HEAD
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchBookWidget()),
                );
=======
                Navigator.pop(context);
>>>>>>> a1066918a6d8395b9d8436db18a43594e18d9ac7
              },
            ),
          ],
        ),
      ),
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
<<<<<<< HEAD
                        child: Container(
                            color: Colors.white, child: DataTableWidget()),
=======
                        child: Table(
                          defaultColumnWidth: IntrinsicColumnWidth(),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Color(0xFFEEEF08),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Color(0xFFEEEF08),
                                        child: Text(
                                          "Title",
                                          style: TextStyle(
                                            color: Colors.blue.shade800,
                                            fontFamily: 'Solitreo',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Color(0xFFEEEF08),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50),
                                      child: Container(
                                        color: Color(0xFFEEEF08),
                                        child: Text(
                                          "Date Borrowed",
                                          style: TextStyle(
                                            color: Colors.blue.shade800,
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Color(0xFFEEEF08),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50),
                                      child: Container(
                                        color: Color(0xFFEEEF08),
                                        child: Text(
                                          "Return Date",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue.shade800,
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 150, top: 10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "The Very Hungry Caterpillar",
                                          style: TextStyle(
                                            fontFamily: 'Solitreo',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50, top: 10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "02/13/2022",
                                          style: TextStyle(
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50, top: 10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "03/13/2022",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue.shade800,
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Introduction to Neuroscience ",
                                          style: TextStyle(
                                            fontFamily: 'Solitreo',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "05/22/2022",
                                          style: TextStyle(
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "06/22/2022",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue.shade800,
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Technical Writing and Simple Statistics",
                                          style: TextStyle(
                                            fontFamily: 'Solitreo',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "06/12/2022",
                                          style: TextStyle(
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "06/19/2022",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue.shade800,
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Mathematics for Biomedical Physics",
                                          style: TextStyle(
                                            fontFamily: 'Solitreo',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "07/03/2022",
                                          style: TextStyle(
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0, right: 50),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "08/03/2022",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue.shade800,
                                            fontFamily: 'Roboto Condensed',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
>>>>>>> a1066918a6d8395b9d8436db18a43594e18d9ac7
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
<<<<<<< HEAD

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
=======
>>>>>>> a1066918a6d8395b9d8436db18a43594e18d9ac7
