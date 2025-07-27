import 'dart:io';

import 'package:belajar_aplikasi_flutter_intermediate/providers/api/add_story_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
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
  String description = "";
  bool isObscureText = true;
  XFile? imageFile;
  String? imagePath;
  late AddStoryProvider _addStoryProvider;
  late SharedPreferencesProvider _sharedPreferencesProvider;

  _onGalleryView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      imageFile = pickedFile;
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
      imageFile = pickedFile;
    }
  }

  _onUpload() async {
    if (imagePath == null || imageFile == null) return;
    final fileName = imageFile?.name;
    final bytes = await imageFile?.readAsBytes();

    await _addStoryProvider.addStory(
      description: description,
      bytes: bytes as List<int>,
      fileName: fileName ?? "",
      token: _sharedPreferencesProvider.user?.token,
    );
  }

  Widget _showImage() {
    return kIsWeb
        ? Image.network(imageFile?.path.toString() ?? "", fit: BoxFit.contain)
        : Image.file(
            File(imageFile?.path.toString() ?? ""),
            fit: BoxFit.contain,
          );
  }

  @override
  void initState() {
    super.initState();
    _addStoryProvider = context.read<AddStoryProvider>();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
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
            onPressed: _onGalleryView,
            child: const Icon(Icons.photo_outlined),
          ),
          FloatingActionButton.small(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.surface,
            heroTag: null,
            onPressed: _onCameraView,
            child: const Icon(Icons.camera_alt_outlined),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Add Item", style: AppTextStyles.labelLarge),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.chevron_left)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: Key("login_form"),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        imageFile != null
                            ? SizedBox(height: 200, child: _showImage())
                            : SizedBox(),
                        SizedBox(height: 20),
                        TextField(
                          minLines: 5,
                          maxLines: null,
                          style: AppTextStyles.bodyLargeMedium,
                          decoration: InputDecoration(
                            hint: Text(
                              "Enter your story description",
                              style: AppTextStyles.bodyLargeMedium,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1.5,
                              ), // border saat focus
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              description = val;
                            });
                          },
                        ),
                        SizedBox(height: 15),
                        SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _onUpload,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 20),
                            ),
                            child: Text(
                              'Login',
                              style: AppTextStyles.bodyLargeMedium.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppTextStyles.labelMedium.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go("/register");
                      },
                      child: Text(
                        "Register Now",
                        style: AppTextStyles.labelMedium.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
