import 'dart:io';

import 'package:belajar_aplikasi_flutter_intermediate/providers/api/add_story_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/api/get_stories_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/get_latlng_from_map_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/add-story/widget/add_story_form.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/add-story/widget/fab_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../styles/typography/app_typography.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  late AddStoryProvider _addStoryProvider;
  late SharedPreferencesProvider _sharedPreferencesProvider;
  late GetLatLngFromMapProvider _getLatLngFromMapProvider;
  late GetStoriesProvider _getStoriesProvider;

  @override
  void initState() {
    super.initState();
    _addStoryProvider = context.read<AddStoryProvider>();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    _getLatLngFromMapProvider = context.read<GetLatLngFromMapProvider>();
    _getStoriesProvider = context.read<GetStoriesProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (_sharedPreferencesProvider.user == null) {
          context.go("/onboarding");
          return;
        }
        context.go("/");
      },
      child: Scaffold(
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: FabButton(
          onGalleryView: _onGalleryView,
          onCameraView: _onCameraView,
        ),
        appBar: AppBar(
          title: Text("Add Item", style: AppTextStyles.labelLarge),
          leading: IconButton(
            onPressed: () {
              context.go("/");
            },
            icon: Icon(Icons.chevron_left),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: AddStoryForm(
              showImage: _showImage(),
              onGalleryView: _onGalleryView,
              onRemoveImage: _onRemoveImage,
              onUpload: _onUpload,
            ),
          ),
        ),
      ),
    );
  }

  _onGalleryView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      _addStoryProvider.setImageFile(pickedFile);
      _addStoryProvider.setImagePath(pickedFile.path);
    }
  }

  _onCameraView() async {
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
    final isNotMobile = !(isAndroid || isiOS);
    if (isNotMobile) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      _addStoryProvider.setImageFile(pickedFile);
      _addStoryProvider.setImagePath(pickedFile.path);
    }
  }

  _onUpload() async {
    if (_addStoryProvider.imagePath == null ||
        _addStoryProvider.imageFile == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Image must not be empty")));
      return;
    }
    final fileName = _addStoryProvider.imageFile?.name;
    final bytes = await _addStoryProvider.imageFile?.readAsBytes();

    await _addStoryProvider.addStory(
      description: _addStoryProvider.description,
      bytes: bytes as List<int>,
      fileName: fileName ?? "",
      token: _sharedPreferencesProvider.user?.token,
      lat: _getLatLngFromMapProvider.lat,
      lon: _getLatLngFromMapProvider.lon,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(_addStoryProvider.message)));

    if (!_addStoryProvider.error) {
      Future.microtask(() async {
        await _getStoriesProvider.refresh(
          token: _sharedPreferencesProvider.user?.token ?? "",
        );
        Future.delayed(Duration(seconds: 1), () {
          context.go("/");
        });
      });
    }
  }

  Widget _showImage() {
    return kIsWeb
        ? Image.network(
            context.watch<AddStoryProvider>().imageFile?.path.toString() ?? "",
            fit: BoxFit.contain,
          )
        : Image.file(
            File(
              context.watch<AddStoryProvider>().imageFile?.path.toString() ??
                  "",
            ),
            fit: BoxFit.contain,
          );
  }

  _onRemoveImage() async {
    _addStoryProvider.setImageFile(null);
    _addStoryProvider.setImagePath("");
  }
}
