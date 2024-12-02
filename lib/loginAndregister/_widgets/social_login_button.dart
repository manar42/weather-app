import 'package:flutter/material.dart';
class SocialLoginButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;
  const SocialLoginButton({
    super.key,
    required this.assetPath,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            assetPath,
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
