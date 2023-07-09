import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/config/app_colors.dart';
import 'package:onepiece_quiz_king/view_models/ad_view_model.dart';
import 'package:onepiece_quiz_king/view_models/main_view_model.dart';
import 'package:onepiece_quiz_king/widgets/ad_part.dart';
import 'package:onepiece_quiz_king/widgets/drop_down_button.dart';
import 'package:onepiece_quiz_king/widgets/start_button.dart';
import 'package:onepiece_quiz_king/widgets/top_image_and_title.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  FooWidgetState createState() => FooWidgetState();
}

class FooWidgetState extends ConsumerState<HomePage> {
  final MainViewModel _mainViewModel = MainViewModel();
  final AdViewModel _adViewModel = AdViewModel();

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



