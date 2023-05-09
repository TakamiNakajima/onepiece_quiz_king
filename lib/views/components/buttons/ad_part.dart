import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdPart extends StatefulWidget {
  BannerAd? bannerAd;

  AdPart({this.bannerAd});

  @override
  State<AdPart> createState() => _AdPartState();
}

class _AdPartState extends State<AdPart> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 8,
      child: (widget.bannerAd == null)
          ? Container(width: 0, height: 0)
          : Container(
              width: widget.bannerAd?.size.width.toDouble(),
              height: widget.bannerAd?.size.height.toDouble(),
              child: AdWidget(ad: widget.bannerAd!),
            ),
    );
  }
}
