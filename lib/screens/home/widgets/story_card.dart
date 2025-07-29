import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';
import 'package:belajar_aplikasi_flutter_intermediate/styles/typography/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go("/story/${story.id}");
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 200, maxHeight: 200),
        child: Column(
          children: [
            Text(
              '${story.name} - ${story.id}',
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: FadeInImage.assetNetwork(
                placeholder: "images/elementor-placeholder-image.webp",
                image: story.photoUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
