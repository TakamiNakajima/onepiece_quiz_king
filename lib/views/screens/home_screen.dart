import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/data/series.dart';
import 'package:onepiece_quiz_king/parts/button_with_icon.dart';
import 'package:onepiece_quiz_king/views/screens/test_screen.dart';
import '../../const/dropdownitemlist.dart';
import '../components/selected_series_text.dart';
import '../components/title_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isIncludedMemorizedWords = false;
  SERIES _selectedSeries = SERIES.ALL;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset("assets/images/hat2.png"),
                  const TitleText(),
                ],
              ),
            ),
            CupertinoButton(
              disabledColor: Colors.white,
              child: SelectedSeriesText(selectedSeries: _selectedSeries),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: 1,
                    ),
                    children: DropDownItemList,
                    onSelectedItemChanged: (int value) {
                      if (DropDownItemList[value].value != null) {
                        setState(() {
                          _selectedSeries = DropDownItemList[value].value;
                        });
                      }
                      ;
                    },
                  ),
                ),
              ),
            ),
            //スタートボタン
            ButtonWithIcon(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              TestScreen(series: _selectedSeries)));
                },
                icon: Icon(CupertinoIcons.play_arrow),
                label: "スタート",
                color: Color(0xfffcb860)),
            //コピーライト
            Text("powered by Takami Nakajima 2023",
                style: TextStyle(fontSize: 14, fontFamily: "Mont")),
          ],
        ),
      ),
    );
  }
}
