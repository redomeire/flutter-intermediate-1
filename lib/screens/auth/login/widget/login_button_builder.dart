import 'package:flutter/material.dart';
import '../../../../services/http/static/login_result_state.dart';
import '../../../../styles/typography/app_typography.dart';

class LoginConsumerBuilder {
  final VoidCallback handleLogin;
  const LoginConsumerBuilder({required this.handleLogin});

  Widget loginButtonBuilder(context, state, widget) {
    return switch (state.loginResultState) {
      LoginResultStateLoading() => ElevatedButton(
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
              'Login',
              style: AppTextStyles.bodyLargeMedium.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
      LoginResultStateLoaded() => ElevatedButton(
        onPressed: handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          'Login',
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      LoginResultStateError() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
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
        onPressed: handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          'Login',
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    };
  }
}
