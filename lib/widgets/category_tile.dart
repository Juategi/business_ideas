import 'package:business_ideas/config/colors.dart';
import 'package:business_ideas/config/translation.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/icons/${category.toString().split(".").last}.svg',
                    color: AppColors.categoryColors[category],
                    height: 45,
                    width: 45,
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Expanded(
                  child: Text(
                    Translation.translateCategory(category),
                    style: TextStyle(
                      color: AppColors.categoryColors[category],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.categoryColors[category],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
