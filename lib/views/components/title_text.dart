import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("麦わらクイズ",
            style: TextStyle(fontSize: 48, color: Color(0xfffcb860), fontFamily: "Lanobe")),
      ],
    );
  }
}
