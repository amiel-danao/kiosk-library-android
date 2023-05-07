import 'package:http/http.dart' as http;
import '../utils/environment.dart';
import 'dart:convert';

Future<String?> fetchBooksInstances(String searchKey, {String status='', String genre=''}) async {
  String? books;
  final queryParameters = {
    'search': searchKey,
    'status': status
  };
  if(genre.isNotEmpty){
    queryParameters['book__genre__name'] = genre;
  }

  final uri = Uri.https(Environment.domain, '/${Environment.bookInstanceUrl}', queryParameters);
  // final uri = Uri.parse(Environment.bookInstanceUrl);
  final response = await http.get(uri);

  if (response.statusCode == 200){
    books = response.body;
  }
  return books;
}

Future<String?> fetchBorrowedBooks(String studentId) async {
  String? books;
  final queryParameters = {
    'borrower': studentId
  };

  final uri = Uri.https(Environment.domain, Environment.borrowedUrl, queryParameters);
  final response = await http.get(uri);

  if (response.statusCode == 200){
    books = response.body;
  }
  return books;
}

Future<List<String>> fetchGenres() async {
  List<String> genres;

  final url = Uri.parse("${Environment.genreUrl}?format=json");
  final response = await http.get(url);
  // var jsonString = json.encode(response.body);
  genres = (jsonDecode(response.body) as List<dynamic>).cast<String>();

  return genres;
}