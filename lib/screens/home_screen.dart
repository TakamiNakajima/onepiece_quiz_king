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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                _titleText(),
                SizedBox(height: 50),
                SizedBox(height: 200,child: Image.asset("assets/images/luffy.png")),
                //横線
                Divider(height: 100, indent: 20, endIndent: 20, thickness: 1),
                //スタートボタン
                ButtonWithIcon(
                    onPressed: () => _startTestScreen(context),
                    icon: Icon(Icons.play_arrow),
                    label: "スタート",
                    color: Colors.orangeAccent),
                //ラジオボタン
                // _radioButtons(),
                SizedBox(height: 100),
                //コピーライト
                Text("powered by Takami Nakajima 2022",
                    style: TextStyle(fontSize: 14, fontFamily: "Mont")),
                SizedBox(height: 50),
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
        Text("ワンピース", style: TextStyle(fontSize: 50)),
        Text("クイズ王", style: TextStyle(fontSize: 50)),
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
