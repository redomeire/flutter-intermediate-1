import 'package:flutter/material.dart';
import '../../../../services/http/static/register_result_state.dart';
import '../../../../styles/typography/app_typography.dart';

class RegisterConsumerBuilder {
  final VoidCallback handleRegister;
  const RegisterConsumerBuilder({required this.handleRegister});

  Widget registerButtonBuilder(context, state, widget) {
    return switch (state.registerResultState) {
      RegisterResultStateLoading() => ElevatedButton(
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
              'Register',
              style: AppTextStyles.bodyLargeMedium.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
      RegisterResultStateLoaded() => ElevatedButton(
        onPressed: handleRegister,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          'Register',
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      RegisterResultStateError() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: handleRegister,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: Text(
              'Register',
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
        onPressed: handleRegister,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          'Register',
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    };
  }
}
