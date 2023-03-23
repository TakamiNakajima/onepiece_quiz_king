import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/data/series.dart';
import 'package:onepiece_quiz_king/parts/button_with_icon.dart';
import 'package:onepiece_quiz_king/views/screens/test_screen.dart';
import '../../const/dropdownitemlist.dart';

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
                  style: TextStyle(color: Color(0xfffb5f66), fontSize: 16, fontFamily: "Lanobe"),
                    iconEnabledColor: Color(0xfffb5f66),
                    iconSize: 40,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(14),
                    items: DropDownItemList,
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
        Text("麦わらクイズ",
            style: TextStyle(fontSize: 48, color: Color(0xfffcb860))),
        SizedBox(height: 16),
        Text("-Quiz of Mugiwara-",
            style: TextStyle(fontSize: 20, color: Color(0xfffcb860))),
      ],
    );
  }

  _startTestScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestScreen(series: _selectedSeries)));
  }
}
