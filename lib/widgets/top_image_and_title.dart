import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/config/app_text_style.dart';

class TopImageAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/image_hat.png",
            width: 280,
          ),
          const SizedBox(height: 40),
          const Text("麦わらクイズ", style: lanobeLargeTitleTextStyle),
        ],
      ),
    );
  }
}