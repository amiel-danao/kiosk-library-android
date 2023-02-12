import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
  static String get loginUrl => "$apiUrl${dotenv.env['LOGIN_URL'] ?? ''}";
  static String get studentUrl => "$apiUrl${dotenv.env['STUDENT_URL'] ?? ''}";
  static String get bookInstanceUrl => "$apiUrl${dotenv.env['BOOK_INSTANCE_URL'] ?? ''}";
  static String get reservationUrl => "$apiUrl${dotenv.env['RESERVATION_URL'] ?? ''}";
  static String get debugEmail => dotenv.env['DEBUG_EMAIL'] ?? '';
  static String get debugPassword => dotenv.env['DEBUG_PASSWORD'] ?? '';
}