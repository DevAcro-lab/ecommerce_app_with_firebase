import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'header_container.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: s.height * 0.02),
        Align(
          alignment: Alignment.centerLeft,
          child: HeaderContainer(icon: Icons.arrow_back_outlined, onTap: onTap),
        ),
        SizedBox(height: s.height * 0.038),
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: customBlackColor,
          ),
        ),
      ],
    );
  }
}
