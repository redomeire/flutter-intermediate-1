import "package:belajar_aplikasi_flutter_intermediate/models/story.dart";
import "package:bottom_sheet_bar/bottom_sheet_bar.dart";
import "package:flutter/material.dart";

import "../../../shared/widgets/maps/app_map.dart";

class AppBottomSheet extends StatefulWidget {
  final Widget child;
  final Story story;

  const AppBottomSheet({super.key, required this.child, required this.story});

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  final _bsbController = BottomSheetBarController();

  @override
  Widget build(BuildContext context) {
    return BottomSheetBar(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      controller: _bsbController,
      color: Theme.of(context).colorScheme.surface,
      body: AbsorbPointer(
        absorbing: _bsbController.isExpanded,
        child: AppMap(
          initialLat: widget.story.lat,
          initialLon: widget.story.lon,
        ),
      ),
      collapsed: InkWell(
        onTap: () {
          _bsbController.expand();
        },
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(height: 5, width: 50, color: Colors.grey),
            SizedBox(height: 10),
          ],
        ),
      ),
      expandedBuilder: (scrollController) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: InkWell(
                onTap: () {
                  _bsbController.collapse();
                },
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(height: 5, width: 50, color: Colors.grey),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(hasScrollBody: false, child: widget.child),
          ],
        );
      },
    );
  }
}
