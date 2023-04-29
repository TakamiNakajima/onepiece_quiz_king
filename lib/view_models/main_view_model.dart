import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/models/manager/ad_manager.dart';
import 'package:onepiece_quiz_king/views/screens/test_screen.dart';

class MainViewModel {
  int numberOfQuestion = 0;
  String txtQuestion = "問題";
  String txtAnswer = "こたえ";
  int adCount = 5;
  int index = 0; //いま何問目か

  bool isQuestionCardVisible = false;
  bool isAnswerCardVisible = false;
  bool isCheckBoxVisible = false;
  bool isFabVisible = false;

  List<Word> testDataList = [];
  TestStatus testStatus = TestStatus.BEFORE_START;

  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  int numInterstitialLoadAttempt = 0;

  void getBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdManager.bannerAdUnitId,
      listener: BannerAdListener(),
      request: AdRequest(),
    );
  }

  void initInterstitialAd(interstitialAd) {
    InterstitialAd.load(
      adUnitId: AdManager.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          numInterstitialLoadAttempt = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          interstitialAd = null;
          numInterstitialLoadAttempt++;
          if (numInterstitialLoadAttempt <= 3)
            initInterstitialAd(interstitialAd);
        },
      ),
    );
  }

  void loadInterstitialAd(interstitialAd) {
    if (interstitialAd == null) return;
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
      ad.dispose();
      initInterstitialAd(interstitialAd);
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      ad.dispose();
      initInterstitialAd(interstitialAd);
    });
    interstitialAd!.show();
    interstitialAd = null;
  }

  void loadBannerAd() {
    bannerAd?.load();
  }

  void changeStatusOnShowQuestion(currentWord) {
    isQuestionCardVisible = true;
    isAnswerCardVisible = false;
    isCheckBoxVisible = false;
    isFabVisible = true;
    txtQuestion = currentWord.strQuestion;
  }

  void changeStatusOnShowAnswer() {
    isQuestionCardVisible = true;
    isAnswerCardVisible = true;
    isCheckBoxVisible = true;
    isFabVisible = true;
  }
}
