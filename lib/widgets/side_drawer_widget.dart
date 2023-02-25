import 'package:flutter/material.dart';

import '../borrowed_book_page.dart';
import '../models/student.dart';
import '../search_book.dart';

class SideDrawerWidget extends StatelessWidget {
  final Student student;

  const SideDrawerWidget({
    super.key,
    required this.student
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
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
            leading: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            title: const Text('Search Books'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBookWidget(student: student,)),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.book_outlined,
              color: Colors.black,
            ),
            title: const Text('Borrowed Books'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BorrowedBookPageWidget(student: student,)),
              );
            },
          ),
        ],
      ),
    );
  }
}
