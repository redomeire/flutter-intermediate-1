import 'package:belajar_aplikasi_flutter_intermediate/config/flavor/flavor_config.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/get_latlng_from_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  late GetLatLngFromMapProvider _getLatLngFromMapProvider;

  @override
  void initState() {
    super.initState();
    _addStoryProvider = context.read<AddStoryProvider>();
    _getLatLngFromMapProvider = context.read<GetLatLngFromMapProvider>();
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
                              backgroundColor: Theme.of(context).colorScheme.primary,
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
              if (FlavorConfig.instance.flavorType == FlavorType.premium)
                context.watch<GetLatLngFromMapProvider>().lat != null
                    ? TextField(
                  readOnly: true,
                  minLines: 5,
                  maxLines: null,
                  style: AppTextStyles.bodyLargeMedium,
                  controller: TextEditingController(
                    text:
                    "${context.watch<GetLatLngFromMapProvider>().lat} - ${context.watch<GetLatLngFromMapProvider>().lon}",
                  ),
                  decoration: InputDecoration(
                    hint: Text(
                      "Enter your latitude and longitude",
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
                )
                    : SizedBox(),
              SizedBox(height: 15),
              if (FlavorConfig.instance.flavorType == FlavorType.premium)
                context.watch<GetLatLngFromMapProvider>().lat == null
                    ? OutlinedButton(
                  onPressed: () {
                    context.go("/add-story/map");
                  },
                  style: ButtonStyle(),
                  child: Text("Add location"),
                )
                    : OutlinedButton(
                  onPressed: _getLatLngFromMapProvider.clearLocation,
                  child: Text("Clear location"),
                ),
              SizedBox(height: 15),
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
