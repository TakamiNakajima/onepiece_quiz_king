import 'package:flutter/material.dart';

class SelectedQText extends StatefulWidget {
  String text;

  SelectedQText({required this.text});

  @override
  State<SelectedQText> createState() => _SelectedQTextState();
}

class _SelectedQTextState extends State<SelectedQText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: "Lanobe",
        color: Color(0xfffb5f66),
      ),
    );
  }
}
