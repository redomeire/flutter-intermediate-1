import 'package:belajar_aplikasi_flutter_intermediate/providers/api/get_stories_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/home/widgets/story_list.card.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/get_stories_result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetStoriesProvider _getStoriesProvider;
  late SharedPreferencesProvider _sharedPreferencesProvider;

  @override
  void initState() {
    super.initState();
    _getStoriesProvider = context.read<GetStoriesProvider>();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();

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
              GetStoriesResultLoading() => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GetStoriesResultSuccess(listStory: var listStory) =>
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: StoryList(listStory: listStory),
                ),
              GetStoriesResultError() => Center(
                child: Text("Sorry, error happened"),
              ),
              _ => const SizedBox(),
            };
          },
        ),
      ),
    );
  }
}
