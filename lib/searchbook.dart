import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'homepage.dart';

class SearchBookWidget extends StatefulWidget {
  const SearchBookWidget({Key? key}) : super(key: key);

  @override
  _SearchBookWidget createState() => _SearchBookWidget();
}

class _SearchBookWidget extends State<SearchBookWidget> {
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
                Navigator.pop(context);
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search for books",
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
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
                        child: Table(
                          defaultColumnWidth: IntrinsicColumnWidth(),
                          children: [
                            //HEADER ROW
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Color(0xFFEEEF08),
                                        child: Text(
                                          "Author",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Color(0xFFEEEF08),
                                        child: Text(
                                          "Genre",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Color(0xFFEEEF08),
                                        child: Text(
                                          "Publish date",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Color(0xFFEEEF08),
                                        child: Text(
                                          "Status",
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
                                          "Location",
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
                                          "Borrow Count",
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

                            //FIRST LINE ROW
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
                                          bottom: 10.0, right: 150, top: 10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Eric Caire",
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
                                          bottom: 10.0, right: 150, top: 10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Kids Stories",
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
                                          bottom: 10.0, right: 150, top: 10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "1969",
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
                                          bottom: 10.0, right: 150, top: 10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "On loan",
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
                                          "NCST Main Campus",
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
                                          "1",
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

                            //SECOND LINE ROW
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Michigan State University",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Biology ",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "2022 ",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "On loan",
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
                                          "NCST Main Campus",
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
                                          "2",
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

                            //THIRD LINE ROW
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
                                          "Salem’s Lot ",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Stephen King ",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Horror",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "1975 ",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "On loan",
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
                                          "NCST Annex Building",
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
                                          "2",
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

                            //FOURTH LINE ROW
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          " Wayne State University Library System",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "Academical",
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "2022",
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
                                          "Not Available",
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
                                          "NCST Main Campus",
                                          style: TextStyle(
                                            color: Colors.black,
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
                                          bottom: 10.0, right: 150),
                                      child: Container(
                                        color: Colors.white,
                                        child: Text(
                                          "0 ",
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
