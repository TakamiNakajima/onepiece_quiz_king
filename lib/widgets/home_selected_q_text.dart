import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/config/app_colors.dart';
import 'package:onepiece_quiz_king/config/app_text_style.dart';

class SelectedQText extends StatelessWidget {
  late String text;

  SelectedQText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(text, style: montMediumTextStyle),
        ),
        const Icon(Icons.arrow_drop_down_rounded, color: mainColor),
      ],
    );
  }
}
