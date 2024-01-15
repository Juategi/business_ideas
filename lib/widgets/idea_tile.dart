import 'package:business_ideas/entities/idea.dart';
import 'package:business_ideas/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class IdeaTile extends StatelessWidget {
  const IdeaTile({super.key, required this.idea});
  final Idea idea;
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      idea.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Text(
                        idea.smallDescription,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                FavoriteButton(idea: idea)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
