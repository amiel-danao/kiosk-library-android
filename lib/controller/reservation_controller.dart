import 'dart:convert';
import 'package:ncst_kiosk_library/models/reservation.dart';
import 'package:http/http.dart' as http;
import '../utils/environment.dart';

Future<Reservation?> fetchReservedBook({String? studentId, String? bookInstanceId}) async {
  Reservation? reserved;
  var uri = Uri.parse('${Environment.reservationUrl}?student__school_id=${studentId??''}&book_instance=${bookInstanceId??''}');
  final response = await http.get(uri);

  if (response.statusCode == 200){
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Reservation> results = items.map<Reservation>((json) {
      return Reservation.fromJson(json);
    }).toList();

    if (results.isEmpty){
      return null;
    }

    reserved = results.first;
    return reserved;
  }
  return reserved;
}

Future<bool> reserveBook(int studentId, String bookInstanceId) async{
  //re-check if this book is not yet reserved



  final jsonData = json.encode({"student": studentId, "book_instance": bookInstanceId});

  final createResponse = await http.post(
    Uri.parse(Environment.reservationUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonData,
  );

  if (createResponse.statusCode == 201){
    return true;
  }

  return false;
}


Future<bool> deleteReservation(String bookInstanceId) async{
  final url = Uri.parse("${Environment.reservationUrl}$bookInstanceId/");

  http.delete(url).then((response) {
    if (response.statusCode == 200) {
      // Successful DELETE request
      return true;
    } else {
      // Handle unsuccessful DELETE request
      return false;
    }
  }).catchError((error) {
    // Handle any errors that occurred during the DELETE request
    return false;
  });

  return false;
}