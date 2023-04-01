import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/models/data/series.dart';
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Column(
                    children: [
                      Image.asset("assets/images/hat2.png",
                        width: 240,
                      ),
                      SizedBox(height: 20),
                      const TitleText(),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CupertinoButton(
                      disabledColor: Colors.white,
                      child: SelectedSeriesText(selectedSeries: _selectedSeries),
                      onPressed: () => showCupertinoModalPopup(
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
                ),
                //スタートボタン
                SizedBox(
                  width: 160,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  TestScreen(series: _selectedSeries)));
                    },
                    icon: Icon(CupertinoIcons.play_fill),
                    label: Text("スタート", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      backgroundColor: Color(0xfffcb860),
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
