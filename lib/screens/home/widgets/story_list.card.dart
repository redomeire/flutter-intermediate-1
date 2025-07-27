import 'package:belajar_aplikasi_flutter_intermediate/screens/home/widgets/story_card.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return StoryCard();
          },
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.minWidth < 400 ? 1 : 2, // Two columns
            childAspectRatio: 1.0, // Square cells
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
          ),
        );
      },
    );
  }
}
