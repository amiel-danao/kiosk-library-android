import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:ncst_kiosk_library/models/book_instance.dart';
import 'package:ncst_kiosk_library/widgets/loading.dart';
import 'package:ncst_kiosk_library/widgets/side_drawer_widget.dart';
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
  late Future<String> books;
  // bool isLoading = false;

  final columns = [
    JsonTableColumn("title", label: "Title"),
    JsonTableColumn("author", label: "Author"),
    JsonTableColumn("genre", label: "Genre"),
    JsonTableColumn("publish_date", label:"Publish Date"),
    JsonTableColumn("status", label:"Status"),
    JsonTableColumn("location", label:"Location"),
    JsonTableColumn("borrow_count", label:"Borrow Count"),
  ];


  // @override
  // void initState() {
  //   super.initState();
  //   getBooks();
  // }
  //
  // void getBooks() async {
  //   setState(()=>isLoading=true);
  //   books = fetchBooksInstances();
  //   setState(()=>isLoading=false);
  // }

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

        // Image.network(
        //   'https://pbs.twimg.com/profile_images/1227140400877453318/y7lBi1Gd_400x400.jpg',
        //   width: 100,
        //   height: 100,
        //   fit: BoxFit.fill,
        // ),

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
      body: Column(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(

                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search for books",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                        FutureBuilder<String?>(
                          future: fetchBooksInstances(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasData) {
                                return Column(
                                    children: <Widget>[JsonTable(jsonDecode(snapshot.data??'[]'),
                                    columns: columns,
                                    paginationRowCount: 10,
                                    allowRowHighlight: true,
                                    rowHighlightColor: Colors.yellow[500]?.withOpacity(0.7))]);
                              }
                              else{
                                return
                                  Expanded(child:
                                  Column(
                                    children: [
                                      const SearchTableWidget(),
                                  Container(decoration: const BoxDecoration(color: Colors.white), child: const Text('No books'),)
                                  ],));

                              }
                            }
                            else if (snapshot.connectionState == ConnectionState.active){
                              return const CircularProgressIndicator();
                            }

                            return const Text('No books');
                          },
                        )

                        // JsonTable(jsonDecode(books), columns: columns),

                      // FutureBuilder<List<BookInstance>>(
                      //   future: fetchBooksInstances(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState == ConnectionState.done) {
                      //       books = snapshot.data;
                      //       if (snapshot.hasData) {
                      //         return Container(
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey),
                      //           ),
                      //           child: SearchTableWidget(books: books)
                      //         );
                      //       } else {
                      //         return Row(
                      //           children: const <Widget>[
                      //             SizedBox(
                      //               // ignore: sort_child_properties_last
                      //               child: CircularProgressIndicator(),
                      //               width: 30,
                      //               height: 30,
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.all(40),
                      //               child: Text('No Data Found...'),
                      //             ),
                      //           ],
                      //         );
                      //       }
                      //     } else {
                      //       return
                      //         circularProgress();
                      //     }
                      //   },
                      // ),
                      //
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

  DataRow _getDataRow(int index, BookInstance book) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(book.title)),//add name of your columns here
        DataCell(Text(book.author)),
        DataCell(Text(book.genre)),
        DataCell(Text(book.publishDate)),
        DataCell(Text(book.status)),
        DataCell(Text(book.location)),
        DataCell(Text('${book.borrowCount}')),
      ],
    );
  }
}
