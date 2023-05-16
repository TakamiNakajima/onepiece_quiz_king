import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onepiece_quiz_king/view_model/ad_view_model.dart';

class AdPart extends StatelessWidget {
  final BannerAd bannerAd;
  AdPart(this.bannerAd);

  @override
  Widget build(BuildContext context) {
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
}
