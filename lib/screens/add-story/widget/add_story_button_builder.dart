import 'package:flutter/material.dart';

import '../../../services/http/static/add_story_result_state.dart';
import '../../../styles/typography/app_typography.dart';

class AddStoryConsumerBuilder {
  final VoidCallback handleUpload;

  const AddStoryConsumerBuilder({required this.handleUpload});

  Widget addStoryButtonBuilder(context, state, widget) {
    return switch (state.responseState) {
      AddStoryResultStateLoading() => ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
          disabledBackgroundColor: Theme.of(context).colorScheme.inverseSurface,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            SizedBox(
              width: 15.0,
              height: 15.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2.0,
              ),
            ),
            Text(
              'Submit',
              style: AppTextStyles.bodyLargeMedium.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
      AddStoryResultStateLoaded() => ElevatedButton(
        onPressed: handleUpload,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          'Submit',
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      AddStoryResultStateError() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: handleUpload,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: Text(
              'Submit',
              style: AppTextStyles.bodyLargeMedium.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            state.message,
            style: AppTextStyles.bodyLargeMedium.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
      _ => ElevatedButton(
        onPressed: handleUpload,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          'Submit',
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    };
  }
}
