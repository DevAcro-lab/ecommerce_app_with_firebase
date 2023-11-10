import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.onTap,
  });
  final String imgUrl;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(top: 6, bottom: 6, right: 8, left: 5),
          decoration: BoxDecoration(
            color: unselectedRadioColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: s.width * 0.08,
                height: s.height * 0.04,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image(
                  image: NetworkImage(
                    imgUrl,
                  ),
                ),
              ),
              SizedBox(width: s.width * 0.03),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  color: customBlackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
