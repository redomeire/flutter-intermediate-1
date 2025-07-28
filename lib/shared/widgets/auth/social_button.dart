import "package:flutter/material.dart";

List<Widget> buildSocialButtons() {
  return [
    _buildSocialButton(iconUrl: "images/google_logo.webp"),
    const SizedBox(width: 10),
    _buildSocialButton(iconUrl: "images/github_logo.png"),
    const SizedBox(width: 10),
    _buildSocialButton(size: 23, iconUrl: "images/facebook_logo.png"),
  ];
}

Widget _buildSocialButton({required String iconUrl, double size = 25}) {
  return TextButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      padding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
    ),
    child: Image.asset(iconUrl, width: size, height: size),
  );
}
