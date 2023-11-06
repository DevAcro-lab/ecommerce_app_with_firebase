import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: unselectedRadioColor,
            ),
            child: const Icon(
              Icons.arrow_back_outlined,
              color: customBlackColor,
            ),
          ),
        ),
        SizedBox(width: s.width * 0.28),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            color: customBlackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
