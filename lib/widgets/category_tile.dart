import 'package:business_ideas/config/translation.dart';
import 'package:business_ideas/entities/idea.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.category}) : super(key: key);
  final Category category;

  final Map<Category, Gradient> categoryColors = const {
    Category.tech: LinearGradient(
      colors: [Color(0xFF3498db), Color(0xFF2ecc71)],
    ),
    Category.webs: LinearGradient(
      colors: [Color(0xFF3498db), Color(0xFF2ecc71)],
    ),
    Category.ecommerce: LinearGradient(
      colors: [Color(0xFF3498db), Color(0xFF2ecc71)],
    ),
    Category.food: LinearGradient(
      colors: [Color(0xFF2ecc71), Color(0xFF27ae60)],
    ),
    Category.health: LinearGradient(
      colors: [Color(0xFF2ecc71), Color(0xFF27ae60)],
    ),
    Category.education: LinearGradient(
      colors: [Color(0xFF2ecc71), Color(0xFF27ae60)],
    ),
    Category.music: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFd35400)],
    ),
    Category.art: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFd35400)],
    ),
    Category.sports: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFd35400)],
    ),
    Category.videogames: LinearGradient(
      colors: [Color(0xFF9b59b6), Color(0xFF8e44ad)],
    ),
    Category.ai: LinearGradient(
      colors: [Color(0xFF9b59b6), Color(0xFF8e44ad)],
    ),
    Category.vr: LinearGradient(
      colors: [Color(0xFF9b59b6), Color(0xFF8e44ad)],
    ),
    Category.professional: LinearGradient(
      colors: [Color(0xFFe74c3c), Color(0xFFc0392b)],
    ),
    Category.turism: LinearGradient(
      colors: [Color(0xFFe74c3c), Color(0xFFc0392b)],
    ),
    Category.fashion: LinearGradient(
      colors: [Color(0xFFe74c3c), Color(0xFFc0392b)],
    ),
    Category.finances: LinearGradient(
      colors: [Color(0xFFe74c3c), Color(0xFFc0392b)],
    ),
    Category.environment: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFd35400)],
    ),
    Category.mobility: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFd35400)],
    ),
    Category.realState: LinearGradient(
      colors: [Color(0xFFe67e22), Color(0xFFd35400)],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: categoryColors[category],
        ),
        child: ListTile(
          title: Text(
            Translation.translateCategory(category),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),
    );
  }
}
