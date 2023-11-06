import 'package:flutter/material.dart';

class ReUseAbleContainer extends StatelessWidget {
  const ReUseAbleContainer({
    super.key,
    required this.title,
    required this.buttonColor,
    required this.onTap,
    required this.textColor,
  });

  final String title;
  final Color buttonColor;
  final VoidCallback onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: s.width * 0.36,
        padding: const EdgeInsets.symmetric(vertical: 21),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
