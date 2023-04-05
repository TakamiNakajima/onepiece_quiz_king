import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          child: Text(
            "麦わらクイズ",
            style: TextStyle(
                fontSize: 56, color: Colors.white, fontFamily: "Lanobe"),
          ),
          shaderCallback: (Rect rect) {
            return LinearGradient(
              colors: [
                Color(0xFFFDC178),
                Color(0xfffcb860),
              ],
            ).createShader(rect);
          },
        ),
      ],
    );
  }
}
