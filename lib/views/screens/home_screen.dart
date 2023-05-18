import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/view_model/ad_view_model.dart';
import 'package:onepiece_quiz_king/view_model/main_view_model.dart';
import 'package:onepiece_quiz_king/views/components/ad_part.dart';
import 'package:onepiece_quiz_king/views/components/buttons/drop_down_button.dart';
import 'package:onepiece_quiz_king/views/components/buttons/start_button.dart';
import 'package:onepiece_quiz_king/views/components/top_image_and_title.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  FooWidgetState createState() => FooWidgetState();
}

class FooWidgetState extends ConsumerState<HomeScreen> {
  MainViewModel _mainViewModel = MainViewModel();
  AdViewModel _adViewModel = AdViewModel();

  @override
  void initState() {
    super.initState();
    _adViewModel.initBannerAd();
    _adViewModel.initInterstitialAd(ref);
    _adViewModel.loadBannerAd();
    _mainViewModel.readAllProviders(ref);
    _mainViewModel.readAllProviders(ref);
  }

  @override
  void dispose() {
    super.dispose();
    _adViewModel.bannerAd?.dispose();
    _adViewModel.interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: subColor,
      child: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 100, right: 28, left: 28, bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TopImageAndTitle(),
                    DropDownButton(),
                    StartButton(),
                  ],
                ),
              ),
              AdPart(bannerAd: _adViewModel.bannerAd),
            ],
          ),
        ),
      ),
    );
  }
}



