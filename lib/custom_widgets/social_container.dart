import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({
    super.key,
    required this.containerColor,
    required this.imgUrl,
    required this.title,
    required this.onTap,
  });

  final Color containerColor;
  final String imgUrl;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 25,
                child: Image(
                  image: AssetImage(imgUrl),
                )),
            SizedBox(width: s.width * 0.02),
            Text(
              title,
              style: const TextStyle(fontSize: 17, color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
