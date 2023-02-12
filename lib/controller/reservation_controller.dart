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