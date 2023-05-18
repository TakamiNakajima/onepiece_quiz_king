import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/providers/current_series.dart';
import 'package:onepiece_quiz_king/view_model/ad_view_model.dart';
import 'package:onepiece_quiz_king/view_model/main_view_model.dart';
import 'package:onepiece_quiz_king/views/screens/test_screen.dart';

class StartButton extends ConsumerWidget {
  AdViewModel _adViewModel = AdViewModel();
  MainViewModel _mainViewModel = MainViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final series = ref.watch(currentSeriesProvider);
    return SizedBox(
      width: 280,
      height: 54,
      child: TextButton(
        onPressed: () {
          _adViewModel.loadInterstitialAd(ref);
          _mainViewModel.getTestData(ref, series);
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => TestScreen(series: series),
            ),
          );
        },
        child: Text("はじめる", style: lanobeMediumTextStyle),
        style: TextButton.styleFrom(
          backgroundColor: mainColor,
        ),
      ),
    );
  }
}
