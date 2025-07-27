import 'package:flutter/material.dart';

import '../../styles/typography/app_typography.dart';

class DetailScreen extends StatefulWidget {
  final String? storyId;

  const DetailScreen({super.key, required this.storyId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              children: [
                CircleAvatar(child: Text("A")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Title",
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("18 Juni 2025", style: AppTextStyles.bodyLargeRegular),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            FadeInImage.assetNetwork(
              placeholder: "images/elementor-placeholder-image.webp",
              image:
                  "https://images.unsplash.com/photo-1752880051996-9b116757b970?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            ),
            SizedBox(height: 20),
            Text("lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet", style: AppTextStyles.labelLarge,)
          ],
        ),
      ),
    );
  }
}
