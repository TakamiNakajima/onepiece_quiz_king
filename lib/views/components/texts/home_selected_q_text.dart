import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';

class SelectedQText extends StatelessWidget {
  late String text;

  SelectedQText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: subColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(-6, -6),
            color: Colors.white,
          ),
          BoxShadow(
            blurRadius: 8,
            offset: Offset(6, 6),
            color: Color(0xffa7a9af),
          ),
        ]
      ),
      child: SizedBox(
        width: 300,
        height: 40,
        child: Center(
          child: Text(text, style: montMediumTextStyle),
        ),
      ),
    );
  }
}
