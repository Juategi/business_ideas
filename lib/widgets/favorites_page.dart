import 'package:business_ideas/config/colors.dart';
import 'package:business_ideas/config/translation.dart';
import 'package:business_ideas/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.build(
          Translation.translateText('favorites'), AppColors.appBarColor,
          endWidget: const SizedBox.shrink()),
      body: const Center(
        child: Text('Favorites'),
      ),
    );
  }
}
