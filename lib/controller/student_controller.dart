import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/token_response.dart';
import '../utils/Environment.dart';

Future<http.Response> beginLogin(BuildContext context, email, password) async {
  try {
    final jsonData = json.encode({"username": email, "password": password});

    final createResponse = await http.post(
      Uri.parse(Environment.loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );
    return createResponse;
  } on Exception catch (error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
          content: Text(error.toString())),
    );
    return throw Exception(error.toString());
  }
}

Future<Student?> fetchStudentFromToken(TokenResponse tokenResponse) async {
  Student student;
  final response = await http.get(Uri.parse('${Environment.studentUrl}?email=${tokenResponse.email}'));

  if (response.statusCode == 200){
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Student> results = items.map<Student>((json) {
      return Student.fromJson(json);
    }).toList();

    if (results.isEmpty){
      return null;
    }

    student = results.first;
    return student;
  }
  else{
    return null;
  }
}