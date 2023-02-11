import 'package:flutter/material.dart';

import '../book_page.dart';
import '../login_page.dart';
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
              Icons.home,
            ),
            title: const Text('Login Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPageWidget()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.book_outlined,
            ),
            title: const Text('Borrowed Books'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookPageWidget(student: student,)),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.search,
            ),
            title: const Text('Borrowed Books'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBookWidget(student: student,)),
              );
            },
          ),
        ],
      ),
    );
  }
}
