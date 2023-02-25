import 'package:http/http.dart' as http;
import '../utils/environment.dart';

Future<String?> fetchBooksInstances(String searchKey, {String status=''}) async {
  String? books;
  final queryParameters = {
    'search': searchKey,
    'status': status
  };
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