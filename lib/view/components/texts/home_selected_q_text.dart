import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';

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
        Icon(Icons.arrow_drop_down_rounded, color: mainColor),
      ],
    );
  }
}
