import 'package:belajar_aplikasi_flutter_intermediate/providers/api/get_stories_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/home/widgets/story_list.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/get_stories_result_state.dart';
import 'package:belajar_aplikasi_flutter_intermediate/styles/typography/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferencesProvider _sharedPreferencesProvider;
  late GetStoriesProvider _getStoriesProvider;

  @override
  void initState() {
    super.initState();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    _getStoriesProvider = context.read<GetStoriesProvider>();

    Future.microtask(() async {
      await _sharedPreferencesProvider.getUserData();
      await _getStoriesProvider.getStories(
        token: _sharedPreferencesProvider.user?.token ?? "",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<GetStoriesProvider>(
          builder: (context, state, child) {
            return switch (state.responseState) {
              GetStoriesResultStateLoading() =>
                state.pageItems == 1
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    : SizedBox(),
              GetStoriesResultStateLoaded(
                message: var _,
                listStory: var listStory,
              ) =>
                StoryList(listStory: listStory, pageItems: state.pageItems),
              GetStoriesResultStateError() => Center(
                child: Text(
                  "Sorry, error happened",
                  style: AppTextStyles.labelSmall.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              ),
              _ => const SizedBox(),
            };
          },
        ),
      ),
    );
  }
}
