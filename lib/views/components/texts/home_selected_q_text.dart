import 'package:flutter/material.dart';

class SelectedQText extends StatelessWidget {
  late String text;

  SelectedQText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "Lanobe",
        color: Colors.white,
      ),
    );
  }
}
