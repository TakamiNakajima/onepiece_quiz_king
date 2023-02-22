import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/parts/button_with_icon.dart';
import 'package:onepiece_quiz_king/screens/test_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isIncludedMemorizedWords = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Image.asset("assets/images/hat2.png"),
                      SizedBox(height: 24),
                      _titleText(),
                    ],
                  ),
                ),
                //スタートボタン
                ButtonWithIcon(
                    onPressed: () => _startTestScreen(context),
                    icon: Icon(Icons.play_arrow),
                    label: "スタート",
                    color: Color(0xfffcb860)),
                //コピーライト
                Text("powered by Takami Nakajima 2023",
                    style: TextStyle(fontSize: 14, fontFamily: "Mont")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleText() {
    return Column(
      children: [
        Text("麦わらクイズ", style: TextStyle(fontSize: 48, color: Color(0xfffcb860))),
        SizedBox(height: 16),
        Text("-Quiz of Mugiwara-", style: TextStyle(fontSize: 20, color: Color(0xfffcb860))),

      ],
    );
  }

  // Widget _radioButtons() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 50),
  //     child: Column(
  //       children: [
  //         RadioListTile(
  //             title: Text("正解した問題を除外", style: TextStyle(fontSize: 20)),
  //             value: false,
  //             groupValue: isIncludedMemorizedWords,
  //             onChanged: (value) => _onRadioSelected(value)),
  //         RadioListTile(
  //             title: Text("すべての問題", style: TextStyle(fontSize: 20)),
  //             value: true,
  //             groupValue: isIncludedMemorizedWords,
  //             onChanged: (value) => _onRadioSelected(value)),
  //       ],
  //     ),
  //   );
  // }

  _onRadioSelected(bool? value) {
    setState(() {
      isIncludedMemorizedWords = value!;
    });
  }

  _startTestScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TestScreen(isIncludedMemorizedWords: isIncludedMemorizedWords)));
  }
}
