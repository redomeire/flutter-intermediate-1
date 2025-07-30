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
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
          disabledBackgroundColor: Theme.of(context).colorScheme.secondary,
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
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
      AddStoryResultStateLoaded() => ElevatedButton(
        onPressed: handleUpload,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          'Submit',
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      AddStoryResultStateError() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: handleUpload,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: Text(
              'Submit',
              style: AppTextStyles.bodyLargeMedium.copyWith(
                color: Theme.of(context).colorScheme.secondary,
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
          backgroundColor: Theme.of(context).colorScheme.primary,
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
