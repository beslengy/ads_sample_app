import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  //ios: ca-app-pub-3940256099942544/4411468910
  //andro: ca-app-pub-3940256099942544/1033173712
  late InterstitialAd _interstitialAd;
  @override
  void initState() {
    InterstitialAd.load(
        adUnitId: Platform.isIOS ? "ca-app-pub-3940256099942544/4411468910" : "ca-app-pub-3940256099942544/1033173712",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
            _interstitialAd.show();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
