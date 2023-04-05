import 'package:flutter/material.dart';

class SelectedQText extends StatelessWidget {
  late String text;

  SelectedQText({required this.text});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect rect) {
        return LinearGradient(
          colors: [
            Color(0xffff757c),
            Color(0xfffb5f66),
          ],
        ).createShader(rect);
      },
    );
  }
}
