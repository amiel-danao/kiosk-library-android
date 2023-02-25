import 'package:flutter/material.dart';
import 'package:ncst_kiosk_library/controller/book_instance_controller.dart';
import 'package:ncst_kiosk_library/widgets/loading.dart';
import 'package:ncst_kiosk_library/widgets/side_drawer_widget.dart';
import 'package:simple_logger/simple_logger.dart';
import 'models/student.dart';
import 'package:json_table/json_table.dart';
import 'dart:convert';

class BorrowedBookPageWidget extends StatefulWidget {
  final Student student;

  const BorrowedBookPageWidget({Key? key, required this.student}) : super(key: key);

  @override
  State<BorrowedBookPageWidget> createState() => _BookPageWidget();
}

class _BookPageWidget extends State<BorrowedBookPageWidget> {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final logger = SimpleLogger();
  final columns = [
    JsonTableColumn("title", label: "Title"),
    JsonTableColumn("date_borrowed", label: "Date Borrowed"),
    JsonTableColumn("return_date", label: "Return Date"),
  ];
  bool isLoading = false;
  dynamic decoded;

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    getBorrowedBooks();
  }

  getBorrowedBooks() async {
    setState(() {
      isLoading = true;
    });
    var jsonSample = await fetchBorrowedBooks(widget.student.id.toString());


    setState(() {
      if (jsonSample != null) {
        decoded = json.decode(jsonSample);
      }
      isLoading = false;
    });
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
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: Colors.grey)
                              , color: Colors.grey.withAlpha(128)),
                          child: Column(
                            children: <Widget>[
                              (isLoading)?
                              circularProgress():
                              (decoded == null || decoded.length == 0)?
                              const Text('No borrowed books')
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
                                },
                                tableHeaderBuilder: (header) {
                                  return
                                    Container(
                                      padding: const EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 0.5, color: Colors.grey)
                                          , color: Colors.white),
                                      child:
                                      Text(
                                        header!,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.headlineMedium,
                                      ),
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