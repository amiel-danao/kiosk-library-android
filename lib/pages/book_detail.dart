import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ncst_kiosk_library/controller/reservation_controller.dart';
import 'package:ncst_kiosk_library/models/reservation.dart';

import '../models/book_instance.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/student.dart';
import '../widgets/side_drawer_widget.dart';

class BookDetailsWidget extends StatefulWidget {
  const BookDetailsWidget({
    Key? key,
    required this.bookRef,
    required this.student
  }) : super(key: key);

  final BookInstance bookRef;
  final Student student;

  @override
  State<BookDetailsWidget> createState() => _BookDetailsWidgetState();
}

class _BookDetailsWidgetState extends State<BookDetailsWidget>
    with TickerProviderStateMixin {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late bool allowedToReserve = false;
  late bool isReserved = false;
  bool isLoading = false;
  final emptyThumbnail = 'https://free-images.com/or/b724/comic_image_missing_svg.jpg';
  Reservation? reservedBook;
  final DateTime dateNow = DateTime.now();
  late DateTime reserveDate;

  int timeRemaining = 0;

  @override
  void initState() {
    super.initState();
    getAllowedToBorrow();
  }

  Future<void> getAllowedToBorrow() async {
    reservedBook = await fetchReservedBook(studentId: widget.student.schoolId);

    if (reservedBook == null){
      setState(() {
        allowedToReserve = true;
      });
    }
    else{
      reserveDate = DateFormat("yyyy-MM-ddThh:mm").parse(reservedBook!.dateReserved);
    }

    if(reservedBook != null) {
      var difference = dateNow.difference(reserveDate);
      timeRemaining = 60 - difference.inMinutes;
      if (difference.inMinutes <= 60 && difference.inMinutes > 0) {

      } else {
        await deleteReservation(reservedBook!.id.toString());
        reservedBook = null;
        setState(() {
          allowedToReserve = true;
        });
      }
    }

    var res = await fetchReservedBook(bookInstanceId: widget.bookRef.id);
    if(res != null || widget.bookRef.status == 'Reserved'){
      setState(() {
        isReserved = true;
      });
    }
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
      floatingActionButton:
      isReserved == false && allowedToReserve && !isLoading?
      FloatingActionButton.extended(
        onPressed: () async {
          var res = await showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Reserve this Book'),
              content: Text('Are you sure you want to reserve this book now?\nBook: ${widget.bookRef.title}\nNote:Your reserve book will be cancelled if you fail to get the book within 1 hour.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Reserve Now'),
                ),
              ],
            ),
          );

          if (res == 'OK'){
            setState(() {
              isLoading = true;
            });
            var res = await fetchReservedBook(bookInstanceId: widget.bookRef.id);
            if(res != null || widget.bookRef.status == 'Reserved'){
              Fluttertoast.showToast(
                msg: "This was already reserved!",
                toastLength: Toast.LENGTH_SHORT,
              );
              setState(() {
                allowedToReserve = false;
                isReserved = false;
              });
            }
            else {
              var reserved = await reserveBook(
                  widget.student.id, widget.bookRef.id);
              if (reserved) {
                Fluttertoast.showToast(
                  msg: "Book reserved successfully.",
                  toastLength: Toast.LENGTH_SHORT,
                );
                setState(() {
                  allowedToReserve = false;
                });
              }
            }

            setState(() {
              isLoading = false;
            });
          }
        },
        foregroundColor: Colors.white,
        label: const Text('Reserve Now'),
        icon: const Icon(Icons.book_sharp),
        backgroundColor: Colors.blue,
      ):null ,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(padding: const EdgeInsetsDirectional.all(5),
                      child:
                      (isLoading == false)?
                      Column(children: [
                        (allowedToReserve == false && isReserved == false)?const Text('You already have a book reservation'):Container(),
                        (isReserved && allowedToReserve == true)?const Text('This book was already reserved'):Container(),
                        (isReserved && allowedToReserve == false)?const Text('You already reserved this book'):Container(),
                        (reservedBook != null)? Text('$timeRemaining minutes remaining'): Container()

                      ],)
                        :
                        Container()
                      ,),)
,
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 320,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDBE2E7),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: InkWell(
                                  child: Hero(
                                    tag: widget.bookRef.thumbnail?.isEmpty ?? emptyThumbnail,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                        (widget.bookRef.thumbnail?.isEmpty ?? true)?
                                        emptyThumbnail:
                                        widget.bookRef.thumbnail??emptyThumbnail
                                        ,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Card(
                                            clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                            color: const Color(0x3A000000),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.arrow_back_rounded,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.bookRef.title,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text("Author(s): ${widget.bookRef.author}",
                            style: Theme.of(context)
                                .textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text("Location: ${widget.bookRef.location}",
                            style: Theme.of(context)
                                .textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text("Status: ${widget.bookRef.status}",
                            style: Theme.of(context)
                                .textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                    child: InkWell(
                      onTap: () async {
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context),
                        //   ),
                        // );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFA130),
                            size: 24,
                          ),
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Text(
                              '${widget.bookRef.borrowCount}',
                              style: Theme.of(context)
                                  .textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Publish Date: ${widget.bookRef.publishDate}',
                          style: Theme.of(context)
                              .textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}
