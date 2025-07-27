import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class FabButton extends StatefulWidget {
  final VoidCallback onGalleryView;
  final VoidCallback onCameraView;

  const FabButton({
    super.key,
    required this.onGalleryView,
    required this.onCameraView,
  });

  @override
  State<FabButton> createState() => _FabButtonState();
}

class _FabButtonState extends State<FabButton> {
  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      type: ExpandableFabType.up,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.perm_media_outlined),
        fabSize: ExpandableFabSize.regular,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.small,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        shape: const CircleBorder(),
      ),
      children: [
        FloatingActionButton.small(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          heroTag: null,
          onPressed: widget.onGalleryView,
          child: const Icon(Icons.photo_outlined),
        ),
        FloatingActionButton.small(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          heroTag: null,
          onPressed: widget.onCameraView,
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ],
    );
  }
}
