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

  @override
  void initState() {
    super.initState();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdManager.bannerAdUnitId,
      listener: BannerAdListener(),
      request: AdRequest(),
    );
    _loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
                            "assets/images/hat2.png",
                            width: 280,
                          ),
                          SizedBox(height: 40),
                          const TitleText(),
                        ],
                      ),
                    ),
                    Material(
                      child: InkWell(
                        child:
                            SelectedSeriesText(selectedSeries: _selectedSeries),
                        onTap: () => showCupertinoModalPopup(
                          context: context,
                          builder: (_) => SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: CupertinoPicker(
                              backgroundColor: backgroundColor,
                              itemExtent: 40,
                              scrollController: FixedExtentScrollController(
                                initialItem: 1,
                              ),
                              children: DropDownItemList,
                              onSelectedItemChanged: (int value) {
                                if (DropDownItemList[value].value != null) {
                                  setState(() {
                                      _selectedSeries = DropDownItemList[value].value;
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    //スタートボタン
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: backgroundColor,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 8,
                              offset: Offset(-6, -6),
                              color: Colors.white,
                            ),
                            BoxShadow(
                              blurRadius: 8,
                              offset: Offset(6, 6),
                              color: Color(0xffa7a9af),
                            ),
                          ]
                      ),
                      child: SizedBox(
                        width: 300,
                        height: 60,
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
                          child: Text("はじめる", style: lanobeMediumTextStyle),
                          style: TextButton.styleFrom(
                            backgroundColor: mainColor,
                          ),
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

  void _loadBannerAd() {
    bannerAd?.load();
  }

  adPart(BannerAd? bannerAd) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 8,
      child: (bannerAd == null)
          ? Container(width: 0, height: 0)
          : Container(
              width: bannerAd?.size.width.toDouble(),
              height: bannerAd?.size.height.toDouble(),
              child: AdWidget(ad: bannerAd),
            ),
    );
  }
}
