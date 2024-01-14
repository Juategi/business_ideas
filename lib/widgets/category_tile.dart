import 'package:business_ideas/config/translation.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.category}) : super(key: key);
  final Category category;

  final Map<Category, Color> categoryColors = const {
    Category.tech: Color(0xFF3498db),
    Category.webs: Color(0xFF3498db),
    Category.ecommerce: Color(0xFF3498db),
    Category.food: Color(0xFF2ecc71),
    Category.health: Color(0xFF2ecc71),
    Category.education: Color(0xFF2ecc71),
    Category.music: Color(0xFFe67e22),
    Category.art: Color(0xFFe67e22),
    Category.sports: Color(0xFFe67e22),
    Category.videogames: Color(0xFF9b59b6),
    Category.ai: Color(0xFF9b59b6),
    Category.vr: Color(0xFF9b59b6),
    Category.professional: Color(0xFFe74c3c),
    Category.turism: Color(0xFFe74c3c),
    Category.fashion: Color(0xFFe74c3c),
    Category.finances: Color(0xFFe74c3c),
    Category.environment: Color(0xFFe67e22),
    Category.mobility: Color(0xFFe67e22),
    Category.realState: Color(0xFFe67e22),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
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
                  color: categoryColors[category],
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
                    color: categoryColors[category],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: categoryColors[category],
              )
            ],
          ),
        ),
      ),
    );
  }
}
