import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/api/add_story_provider.dart';
import '../../../styles/typography/app_typography.dart';
import 'add_story_button_builder.dart';

class AddStoryForm extends StatefulWidget {
  final Widget showImage;
  final VoidCallback onGalleryView;
  final VoidCallback onRemoveImage;
  final VoidCallback onUpload;

  const AddStoryForm({
    super.key,
    required this.showImage,
    required this.onGalleryView,
    required this.onRemoveImage,
    required this.onUpload,
  });

  @override
  State<AddStoryForm> createState() => _AddStoryFormState();
}

class _AddStoryFormState extends State<AddStoryForm> {
  late AddStoryProvider _addStoryProvider;

  @override
  void initState() {
    super.initState();
    _addStoryProvider = context.read<AddStoryProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                          Center(child: widget.showImage),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: widget.onRemoveImage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Remove',
                                style: AppTextStyles.bodyLargeMedium.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
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
                  builder: AddStoryConsumerBuilder(
                    handleUpload: widget.onUpload,
                  ).addStoryButtonBuilder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
