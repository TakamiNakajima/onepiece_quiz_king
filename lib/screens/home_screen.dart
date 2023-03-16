import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/data/series.dart';
import 'package:onepiece_quiz_king/parts/button_with_icon.dart';
import 'package:onepiece_quiz_king/screens/test_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isIncludedMemorizedWords = false;
  SERIES _selectedSeries = SERIES.ALL;


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
                DropdownButton(
                  alignment: Alignment.center,
                  style: TextStyle(color: Color(0xfffcb860), fontSize: 16, fontWeight: FontWeight.bold),
                    iconEnabledColor: Color(0xfffcb860),
                    iconSize: 40,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(14),
                  underline: Container(
                    height: 1,
                    color: Color(0xfffcb860),
                  ),
                    items: [
                      DropdownMenuItem<SERIES>(value: SERIES.ALL, child: Text("すべての問題")),
                      DropdownMenuItem<SERIES>(value: SERIES.EASTBLUE, child: Text("イーストブルー編")),
                      DropdownMenuItem<SERIES>(value: SERIES.ALABASTA, child: Text("アラバスタ編")),
                      DropdownMenuItem<SERIES>(value: SERIES.SKYISLAND, child: Text("ジャヤ & 空島編")),
                      DropdownMenuItem<SERIES>(value: SERIES.WATERSEVEN, child: Text("ウォーターセブン & エニエスロビー編")),
                      DropdownMenuItem<SERIES>(value: SERIES.THRILLERBARK, child: Text("スリラーバーク & シャボンディ諸島編")),
                      DropdownMenuItem<SERIES>(value: SERIES.IMPELDOWN, child: Text("インペルダウン & マリンフォード編")),
                      DropdownMenuItem<SERIES>(value: SERIES.FISHMANISLAND, child: Text("魚人島 & パンクハザード編")),
                      DropdownMenuItem<SERIES>(value: SERIES.DRESSROSA, child: Text("ドレスローザ編")),
                      DropdownMenuItem<SERIES>(value: SERIES.WHOLECAKEISLAND, child: Text("ゾウ & ホールケーキアイランド編")),
                      DropdownMenuItem<SERIES>(value: SERIES.WANOKUNI, child: Text("ワノ国編")),
                    ],
                    value: _selectedSeries,
                    onChanged: (selectedValue){
                      setState(() {
                        _selectedSeries = selectedValue!;
                      });
                    },
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

  _startTestScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TestScreen(series: _selectedSeries)));
  }
}
