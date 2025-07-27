import 'package:belajar_aplikasi_flutter_intermediate/styles/typography/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go("/details");
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 100, maxHeight: 100),
        child: Column(
          children: [
            Text(
              "Card Title",
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: FadeInImage.assetNetwork(
                placeholder: "images/elementor-placeholder-image.webp",
                image:
                    "https://images.unsplash.com/photo-1752880051996-9b116757b970?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
