import 'package:belajar_aplikasi_flutter_intermediate/providers/api/get_story_detail_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/get_story_detail_result_state.dart';
import 'package:belajar_aplikasi_flutter_intermediate/utils/color_randomizer.dart';
import 'package:belajar_aplikasi_flutter_intermediate/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../styles/typography/app_typography.dart';

class DetailScreen extends StatefulWidget {
  final String? storyId;

  const DetailScreen({super.key, required this.storyId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late SharedPreferencesProvider _sharedPreferencesProvider;
  late GetStoryDetailProvider _getStoryDetailProvider;
  final avatarColor = getRandomColor();

  @override
  void initState() {
    super.initState();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    _getStoryDetailProvider = context.read<GetStoryDetailProvider>();

    Future.microtask(() async {
      await _sharedPreferencesProvider.getUserData();
      await _getStoryDetailProvider.getStoryDetail(
        widget.storyId ?? "",
        _sharedPreferencesProvider.user?.token ?? "",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetStoryDetailProvider>(
      builder: (context, state, child) {
        return switch (state.responseState) {
          GetStoryDetailResultNone() => const SizedBox(),
          GetStoryDetailResultLoading() => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GetStoryDetailResultSuccess(story: var story) =>
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        CircleAvatar(
                          backgroundColor: avatarColor,
                          foregroundColor: Colors.white,
                          child: Text(story.name[0]),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              story.name,
                              style: AppTextStyles.titleMedium.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dateFormatter(story.createdAt),
                              style: AppTextStyles.bodyLargeRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    FadeInImage.assetNetwork(
                      placeholder: "images/elementor-placeholder-image.webp",
                      image: story.photoUrl,
                    ),
                    SizedBox(height: 20),
                    Text(story.description, style: AppTextStyles.labelLarge),
                  ],
                ),
              ),
            ),
          GetStoryDetailResultError(message: var message) => Center(
            child: Text(message),
          ),
        };
      },
    );
  }
}
