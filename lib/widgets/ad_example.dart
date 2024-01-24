import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeExample extends StatefulWidget {
  const NativeExample({super.key});

  @override
  State<NativeExample> createState() => _NativeExampleState();
}

class _NativeExampleState extends State<NativeExample> {
  NativeAd? nativeAd;
  bool _nativeAdIsLoaded = false;

  // TODO: replace this test ad unit with your own ad unit.
  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-8550647653356634/9701587398'
      //? 'ca-app-pub-3940256099942544/2247696110'
      : 'ca-app-pub-3940256099942544/3986624511';

  @override
  void initState() {
    loadAd();
    super.initState();
  }

  /// Loads a native ad.
  void loadAd() {
    nativeAd = NativeAd(
        adUnitId: _adUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            debugPrint('$NativeAd loaded.');
            setState(() {
              _nativeAdIsLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            // Dispose the ad here to free resources.
            debugPrint('$NativeAd failed to load: $error');
            ad.dispose();
          },
        ),
        request: const AdRequest(),
        // Styling
        nativeTemplateStyle: NativeTemplateStyle(
            // Required: Choose a template.
            templateType: TemplateType.small,
            // Optional: Customize the ad's style.
            mainBackgroundColor: Colors.grey[100],
            cornerRadius: 12,
            callToActionTextStyle: NativeTemplateTextStyle(
                textColor: Colors.cyan,
                backgroundColor: Colors.grey[100],
                style: NativeTemplateFontStyle.monospace,
                size: 16.0),
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.red,
                backgroundColor: Colors.grey[100],
                style: NativeTemplateFontStyle.italic,
                size: 16.0),
            secondaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.green,
                backgroundColor: Colors.grey[100],
                style: NativeTemplateFontStyle.bold,
                size: 16.0),
            tertiaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.brown,
                backgroundColor: Colors.grey[100],
                style: NativeTemplateFontStyle.normal,
                size: 16.0)))
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    return nativeAd == null
        ? const SizedBox()
        : _nativeAdIsLoaded
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[100]),
                  child: AdWidget(ad: nativeAd!),
                ),
              )
            : const SizedBox();
  }
}
