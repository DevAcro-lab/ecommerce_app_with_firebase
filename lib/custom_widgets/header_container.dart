import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: unselectedRadioColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: customBlackColor,
        ),
      ),
    );
  }
}
