import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:ncst_kiosk_library/models/book_instance.dart';
import 'package:ncst_kiosk_library/pages/book_detail.dart';
import 'package:ncst_kiosk_library/widgets/dropdown.dart';
import 'package:ncst_kiosk_library/widgets/loading.dart';
import 'package:ncst_kiosk_library/widgets/side_drawer_widget.dart';
import 'package:simple_logger/simple_logger.dart';
import 'controller/book_instance_controller.dart';
import 'models/student.dart';

class SearchBookWidget extends StatefulWidget {
  final Student student;
  const SearchBookWidget({Key? key, required this.student}) : super(key: key);

  @override
  State<SearchBookWidget> createState() => _SearchBookWidget();
}

class _SearchBookWidget extends State<SearchBookWidget> {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final logger = SimpleLogger();
  late Future<String> books;
  final searchInput = TextEditingController();

  final columns = [
    JsonTableColumn("title", label: "Title"),
    JsonTableColumn("author", label: "Author"),
    JsonTableColumn("genre", label: "Genre"),
    JsonTableColumn("publish_date", label:"Publish Date"),
    JsonTableColumn("status", label:"Status"),
    JsonTableColumn("location", label:"Location"),
    JsonTableColumn("borrow_count", label:"Borrow Count"),
  ];
  bool isLoading = false;
  late String? jsonSample;

  dynamic decoded;

  final List<String> bookStates = ["All", "On loan", "Available", "Reserved"];
  late List<String> genres = ["All"];
  late Map<String, String> sortColumnNames = {};
  late Map<String, bool> sortColumnStates= {};

  String selectedStatus = '';
  String selectedGenre = '';

  @override
  initState(){
    super.initState();
    getBooks();
    getGenres();
    for(var column in columns){
      sortColumnNames[column.label??''] = column.field??'';
      sortColumnStates[column.label??''] = false;
    }
  }

  getGenres() async{
    var fetchedGenres = await fetchGenres();
    genres = genres + fetchedGenres;
  }

  getBooks() async {
    setState(() {
      isLoading = true;
    });
    jsonSample = await fetchBooksInstances(searchInput.value.text, status: selectedStatus, genre: selectedGenre);

    setState(() {
      decoded = json.decode(jsonSample as String);
      isLoading = false;
    });
  }

  sortBooks(){
    var unsorted = decoded;
    List<BookInstance> booksList =
    unsorted.map((d) => BookInstance.fromJson(d)).toList();

    booksList.sort((bookA, bookB) {
      return bookA.title.toLowerCase().compareTo(bookB.title.toLowerCase());
    });

    setState(() {
      decoded = booksList.map((e) => e.toJson());
    });
  }

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
        leading:
        const Image(
          image: AssetImage('assets/icon/logo_small.png'),

          fit: BoxFit.fitHeight,
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
      endDrawer:
      SideDrawerWidget(student: widget.student,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getBooks();
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.refresh),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child:

                SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 60, top: 16.0),
                    child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: searchInput,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: (){
                              getBooks();
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search for title/author",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5, color: Colors.grey)
                                  , color: Colors.grey.withAlpha(128)),
                              child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left:8.0, top:0, right:8, bottom:0),
                                    child:Row(
                                  children: [
                                    const Text('Status:'),
                                    DropdownButtonExample(list: bookStates, onChange: (str){
                                      if (str == 'All'){
                                        setState(() {
                                          selectedStatus = '';
                                        });
                                      }
                                      else {
                                        int index = bookStates.indexOf(str!) - 1;
                                        logger.info('state: $index');
                                        setState(() {
                                          selectedStatus = '$index';
                                        });
                                      }
                                      getBooks();
                                    })],
                                )),

                                Padding(
                                  padding: const EdgeInsets.only(left:8.0, top:0, right:8, bottom:2),
                                  child:Row(
                                    children: [
                                const Text('Genre:'),
                                DropdownButtonExample(

                                    list: genres, onChange: (str){
                                  if (str == 'All'){
                                    setState(() {
                                      selectedGenre = '';
                                    });
                                  }
                                  else {
                                    // int index = genres.indexOf(str!) - 1;
                                    logger.info('genre: $str');
                                    setState(() {
                                      selectedGenre = str!;
                                    });
                                  }
                                  getBooks();
                                })
                                ])),

                                (isLoading)?
                                circularProgress():
                                (decoded == null || decoded.length == 0)?
                                    const Text('No search result')
                                    :
                                JsonTable(
                                  decoded,
                                  columns: columns,
                                  // showColumnToggle: true,
                                  paginationRowCount: 10,
                                  allowRowHighlight: true,
                                  // filterTitle: 'Toggle Columns',
                                  rowHighlightColor: Colors.yellow[500]?.withOpacity(0.7),
                                  onRowSelect: (index, map) {
                                    var encoded = jsonEncode(map);
                                    logger.info(encoded);
                                    var decoded = jsonDecode(encoded);
                                    var bookInstance = BookInstance.fromJson(decoded);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BookDetailsWidget(bookRef: bookInstance, student: widget.student)),
                                    );
                                  },
                                  tableHeaderBuilder: (header) {
                                    return
                                      Container(
                                      padding: const EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 0.5, color: Colors.grey)
                                          , color: Colors.white),
                                      child:
                                      Center(child:
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              sortColumnStates[header] == true?Icons.arrow_upward:Icons.arrow_downward, color: Colors.black,),
                                            tooltip: 'Sort by $header',
                                            onPressed: () {
                                              String columnName = header??'';
                                              setState(() {
                                                sortColumnStates[columnName] = !sortColumnStates[columnName]!;
                                              });
                                              sortBooks();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text("Sorted by $header")),
                                              );
                                            },
                                          ),
                                          Text(
                                            header!,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          )
                                        ],
                                      )),
                                    );
                                  },
                                  tableCellBuilder: (value) {
                                    return Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey), color: Colors.white),
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),)
                      ,

                  ],
                )
                )

            ),
          ),
        ],
      ),
    );
  }




}


class SearchTableWidget extends StatelessWidget {

  const SearchTableWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor:
      MaterialStateColor.resolveWith((states) => Colors.white),
      columns: [
        DataColumn(
            label: Text(
          'Title',
              style: Theme.of(context).textTheme.headlineMedium,
        )),
        DataColumn(
            label: Text(
          'Author',
          style: Theme.of(context).textTheme.headlineMedium,
        )),
        DataColumn(
            label: Text(
          'Genre',
              style: Theme.of(context).textTheme.headlineMedium,
        )),
        DataColumn(
            label: Text(
          'Publish Date',
              style: Theme.of(context).textTheme.headlineMedium,
        )),
        DataColumn(
            label: Text(
          'Status',
              style: Theme.of(context).textTheme.headlineMedium,
        )),
        DataColumn(
            label: Text(
          'Location',
              style: Theme.of(context).textTheme.headlineMedium,
        )),
        DataColumn(
            label: Text(
          'Borrow Count',
              style: Theme.of(context).textTheme.headlineMedium,
        )),
      ],
      rows: List.empty()
    );
  }

}
