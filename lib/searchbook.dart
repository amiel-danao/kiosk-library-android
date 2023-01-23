import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'homepage.dart';
import 'profilepage.dart';
import 'bookpage.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookPageWidget()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
              ),
              title: const Text('Borrowed Books'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchBookWidget()),
                );
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
                        child: Container(
                          color: Colors.white,
                          child: SearchTableWidget(),
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

class SearchTableWidget extends StatelessWidget {
  final List<Map<String, String>> listOfColumns = [
    {
      "Title": "The Very Hungry Caterpillar",
      "Author": "Eric Caire",
      'Genre': "Kids Stories",
      'Publish Date': "1969",
      "Status": "On loan",
      'Location': 'NCST Main Campus',
      "Borrow Count": "1",
    },
    {
      "Title": "Introduction to Neuroscience",
      "Author": "Michigan State University",
      'Genre': "Biology ",
      'Publish Date': "2022",
      "Status": "On loan",
      'Location': 'NCST Main Campus',
      "Borrow Count": "2",
    },
    {
      "Title": "Mathematics for Biomedical Physics",
      "Author": "Wayne State University Library System",
      'Genre': "Academical",
      'Publish Date': "2022",
      "Status": "Not Available",
      'Location': 'Not Available',
      "Borrow Count": "2",
    },
    {
      "Title": "Salem’s Lot",
      "Author": "Stephen King",
      'Genre': "Horror",
      'Publish Date': "1975",
      "Status": "On loan",
      'Location': 'NCST Annex Building',
      "Borrow Count": "2",
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
            label: Text(
          'Author',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontFamily: 'Solitreo',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        )),
        DataColumn(
            label: Text(
          'Genre',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontFamily: 'Solitreo',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        )),
        DataColumn(
            label: Text(
          'Publish Date',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontFamily: 'Solitreo',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        )),
        DataColumn(
            label: Text(
          'Status',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontFamily: 'Solitreo',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        )),
        DataColumn(
            label: Text(
          'Location',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontFamily: 'Solitreo',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        )),
        DataColumn(
            label: Text(
          'Borrow Count',
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
                        )),
                        DataCell(Text(
                          element["Author"]!,
                          style: TextStyle(
                            fontFamily: 'Solitreo',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )),
                        DataCell(Text(
                          element["Genre"]!,
                          style: TextStyle(
                            fontFamily: 'Solitreo',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )),
                        DataCell(Text(
                          element["Publish Date"]!,
                          style: TextStyle(
                            fontFamily: 'Solitreo',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )),
                        DataCell(Text(
                          element["Status"]!,
                          style: TextStyle(
                            fontFamily: 'Solitreo',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )),
                        DataCell(Text(
                          element["Location"]!,
                          style: TextStyle(
                            fontFamily: 'Solitreo',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )), //Extracting from Map element the value
                        DataCell(
                          Text(
                            element["Borrow Count"]!,
                            style: TextStyle(
                              fontFamily: 'Solitreo',
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )),
              )
              .toList(),
    );
  }
}
