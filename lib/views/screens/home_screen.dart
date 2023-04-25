import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/models/data/series.dart';
import 'package:onepiece_quiz_king/models/manager/ad_manager.dart';
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
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  int _numInterstitialLoadAttempt = 0;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
    _initBannerAd();
    _initInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd?.dispose();
    interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xfff2d6a2),
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
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/image_hat.png",
                            width: 280,
                          ),
                          SizedBox(height: 40),
                          const TitleText(),
                        ],
                      ),
                    ),
                    TextButton(
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
                                setState(
                                  () {
                                    _selectedSeries =
                                        DropDownItemList[value].value;
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      child:
                          SelectedSeriesText(selectedSeries: _selectedSeries),
                    ),
                    //スタートボタン
                    SizedBox(
                      width: 280,
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          _loadInterstitialAd();
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  TestScreen(series: _selectedSeries),
                            ),
                          );
                        },
                        child: Text("はじめる", style: lanobeMediumTextStyle),
                        style: TextButton.styleFrom(
                          backgroundColor: mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              adPart(bannerAd),
            ],
          ),
        ),
      ),
    );
  }

  void _initBannerAd() {
    bannerAd?.load();
  }

  void _initInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdManager.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          _numInterstitialLoadAttempt = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          interstitialAd = null;
          _numInterstitialLoadAttempt++;
          if (_numInterstitialLoadAttempt <= 3) _initInterstitialAd();
        },
      ),
    );
  }

  adPart(BannerAd? bannerAd) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 8,
      child: (bannerAd == null)
          ? Container(width: 0, height: 0)
          : Container(
              width: bannerAd.size.width.toDouble(),
              height: bannerAd.size.height.toDouble(),
              child: AdWidget(ad: bannerAd),
            ),
    );
  }

  void _loadBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdManager.bannerAdUnitId,
      listener: BannerAdListener(),
      request: AdRequest(),
    );
  }

  void _loadInterstitialAd() {
    if (interstitialAd == null) return;
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
      ad.dispose();
      _initInterstitialAd();
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      ad.dispose();
      _initInterstitialAd();
    });
    interstitialAd!.show();
    interstitialAd = null;
  }
}
