import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/dropdownitemlist.dart';
import 'package:onepiece_quiz_king/models/data/series.dart';
import 'package:onepiece_quiz_king/views/components/texts/selected_series_text.dart';
import 'package:onepiece_quiz_king/views/components/texts/title_text.dart';
import 'package:onepiece_quiz_king/views/screens/test_screen.dart';

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
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 40, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/hat2.png",
                        width: 240,
                      ),
                      SizedBox(height: 20),
                      const TitleText(),
                    ],
                  ),
                ),
                Material(
                  child: InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xfffb5f66),
                              Colors.orangeAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white38,
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: SelectedSeriesText(
                              selectedSeries: _selectedSeries),
                        ),
                      ),
                    ),
                    onTap: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.infinity,
                        height: 300,
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
                ),
                //スタートボタン
                DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xfffb5f66),
                        Colors.orangeAccent,
                        //add more colors
                      ]),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0),
                            //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              TestScreen(series: _selectedSeries),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      disabledForegroundColor:
                          Colors.transparent.withOpacity(0),
                      disabledBackgroundColor:
                          Colors.transparent.withOpacity(0),
                      shadowColor: Colors.transparent,
                      //make color or elevated button transparent
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "はじめる",
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
