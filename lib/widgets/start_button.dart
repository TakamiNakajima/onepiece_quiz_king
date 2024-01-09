import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/config/app_colors.dart';
import 'package:onepiece_quiz_king/config/app_text_style.dart';
import 'package:onepiece_quiz_king/states/providers.dart';
import 'package:onepiece_quiz_king/view_models/ad_view_model.dart';
import 'package:onepiece_quiz_king/view_models/main_view_model.dart';
import 'package:onepiece_quiz_king/widgets/pages/quiz_page.dart';

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
              builder: (context) => QuizPage(),
            ),
          );
        },
        child: const Text("はじめる", style: lanobeMediumTextStyle),
        style: TextButton.styleFrom(
          backgroundColor: mainColor,
        ),
      ),
    );
  }
}
