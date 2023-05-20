import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/provider/current_series.dart';
import 'package:onepiece_quiz_king/view/screens/test_screen.dart';
import 'package:onepiece_quiz_king/view_model/ad_view_model.dart';
import 'package:onepiece_quiz_king/view_model/main_view_model.dart';

class StartButton extends ConsumerWidget {
  final AdViewModel _adViewModel = AdViewModel();
  final MainViewModel _mainViewModel = MainViewModel();

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
              builder: (context) => TestScreen(),
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
