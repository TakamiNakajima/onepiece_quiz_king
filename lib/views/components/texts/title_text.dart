import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("麦わらクイズ", style: lanobeLargeTitleTextStyle);
  }
}
