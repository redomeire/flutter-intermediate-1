import 'dart:io';

import 'package:belajar_aplikasi_flutter_intermediate/providers/api/add_story_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/onboarding/widgets/fab_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../services/http/static/add_story_result_state.dart';
import '../../styles/typography/app_typography.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  late AddStoryProvider _addStoryProvider;
  late SharedPreferencesProvider _sharedPreferencesProvider;

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
    );

    if (!_addStoryProvider.error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_addStoryProvider.message)));
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: Key("story_form"),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        context.watch<AddStoryProvider>().imageFile != null
                            ? SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Center(child: _showImage()),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: _onRemoveImage,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Remove',
                                          style: AppTextStyles.bodyLargeMedium
                                              .copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.surface,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
                            _addStoryProvider.description = val;
                          },
                        ),
                        SizedBox(height: 15),
                        SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: Consumer<AddStoryProvider>(
                            builder: (context, state, child) {
                              return switch (state.responseState) {
                                AddStoryResultLoading() => ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    disabledBackgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10,
                                    children: [
                                      SizedBox(
                                        width: 15.0,
                                        height: 15.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                          strokeWidth: 2.0,
                                        ),
                                      ),
                                      Text(
                                        'Submit',
                                        style: AppTextStyles.bodyLargeMedium
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                AddStoryResultSuccess() => ElevatedButton(
                                  onPressed: _onUpload,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: AppTextStyles.bodyLargeMedium
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.surface,
                                        ),
                                  ),
                                ),
                                AddStoryResultFailed() => Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ElevatedButton(
                                      onPressed: _onUpload,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                      ),
                                      child: Text(
                                        'Submit',
                                        style: AppTextStyles.bodyLargeMedium
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                            ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      state.message,
                                      style: AppTextStyles.bodyLargeMedium
                                          .copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.error,
                                          ),
                                    ),
                                  ],
                                ),
                                _ => ElevatedButton(
                                  onPressed: _onUpload,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: AppTextStyles.bodyLargeMedium
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.surface,
                                        ),
                                  ),
                                ),
                              };
                            },
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
    );
  }
}
