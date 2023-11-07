import 'package:flutter/material.dart';

import '../constants/colors.dart';


class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.s,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final Size s;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            SizedBox(height: s.height * 0.065),
            Icon(
              icon,
              size: 25,
              color: customBlackColor,
            ),
            SizedBox(width: s.width * 0.03),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: customBlackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
