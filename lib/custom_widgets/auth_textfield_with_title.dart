import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    super.key,
    required this.title,
    required this.controller,
    this.spacing = false,
  });

  final String title;
  final TextEditingController controller;
  final bool spacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: lightGreyColor,
              letterSpacing: spacing ? 3 : 0,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextFormField(
            controller: controller,
            style: const TextStyle(
              fontSize: 15,
              color: customBlackColor,
            ),
            cursorColor: primaryColor,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: textFieldBorderColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
