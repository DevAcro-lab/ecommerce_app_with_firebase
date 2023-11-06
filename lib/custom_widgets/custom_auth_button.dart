import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: s.height * 0.08,
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
