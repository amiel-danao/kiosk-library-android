import 'package:flutter/material.dart';

circularProgress<Widget>() {
  return Container(
    color: const Color.fromARGB(128, 0, 0, 0),
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12.0),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.redAccent),
    ),
  );
}