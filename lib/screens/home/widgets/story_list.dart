import 'package:belajar_aplikasi_flutter_intermediate/models/story.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/api/get_stories_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/home/widgets/story_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryList extends StatefulWidget {
  final List<Story> listStory;
  final int? pageItems;

  const StoryList({
    super.key,
    required this.listStory,
    required this.pageItems,
  });

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  final ScrollController scrollController = ScrollController();
  late GetStoriesProvider _getStoriesProvider;
  late SharedPreferencesProvider _sharedPreferencesProvider;

  @override
  void initState() {
    super.initState();
    _getStoriesProvider = context.read<GetStoriesProvider>();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (widget.pageItems != null) {
          _getStoriesProvider.getStories(
            token: _sharedPreferencesProvider.user?.token ?? "",
          );
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          controller: scrollController,
          itemCount:
              widget.listStory.length + (widget.pageItems != null ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == widget.listStory.length && widget.pageItems != null) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final story = widget.listStory[index];
            return StoryCard(story: story);
          },
        );
      },
    );
  }
}
