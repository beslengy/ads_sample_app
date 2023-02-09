import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

import 'screen_two.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  //ios: ca-app-pub-3940256099942544/2934735716
  //andro: ca-app-pub-3940256099942544/6300978111
  late BannerAd _myBanner;

  @override
  void initState() {
    _myBanner = BannerAd(
      adUnitId: Platform.isAndroid ? 'ca-app-pub-3940256099942544/6300978111' : 'ca-app-pub-3940256099942544/2934735716',
      size: AdSize.mediumRectangle,
      request: AdRequest(),
      listener: BannerAdListener(),
    )..load();
    super.initState();
  }

  @override
  void dispose() {
    _myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: AdWidget(ad: _myBanner,),
              width: _myBanner.size.width.toDouble(),
              height: _myBanner.size.height.toDouble(),
            ),
            SizedBox(height: 5,),
            TextButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenTwo()));
            }, child: Text("Go to second screen"))
          ],
        ),
      ),
    );
  }
}
