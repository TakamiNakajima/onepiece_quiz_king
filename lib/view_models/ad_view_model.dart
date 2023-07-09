import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onepiece_quiz_king/repository/ad_manager.dart';
import 'package:onepiece_quiz_king/states/interstitial_load_attempt_provider.dart';

class AdViewModel {
  InterstitialAd? interstitialAd;
  BannerAd? bannerAd;

  void loadInterstitialAd(ref) {
    if (interstitialAd == null) return;
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          initInterstitialAd(ref);
        }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      ad.dispose();
      initInterstitialAd(ref);
    });
    interstitialAd!.show();
    interstitialAd = null;
  }

  void initInterstitialAd(ref) {
    InterstitialAd.load(
      adUnitId: AdManager.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          ref.read(interstitialNumProvider.notifier).state = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          interstitialAd = null;
          ref.read(interstitialNumProvider.notifier).state++;
          if (ref.watch(interstitialNumProvider) <= 3) initInterstitialAd(ref);
        },
      ),
    );
  }

  void loadBannerAd() {
    bannerAd?.load();
  }

  void initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdManager.bannerAdUnitId,
      listener: BannerAdListener(),
      request: AdRequest(),
    );
  }
}