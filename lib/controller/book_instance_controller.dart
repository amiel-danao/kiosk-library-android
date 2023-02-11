import 'dart:convert';
import 'package:ncst_kiosk_library/models/book_instance.dart';
import 'package:http/http.dart' as http;
import '../utils/environment.dart';

Future<String?> fetchBooksInstances() async {
  String? books;
  final response = await http.get(Uri.parse(Environment.bookInstanceUrl));

  if (response.statusCode == 200){
    books = response.body;
  }
  return books;
}