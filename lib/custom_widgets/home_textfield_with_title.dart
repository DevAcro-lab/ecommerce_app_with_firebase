import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HomeTextFieldWithTitle extends StatelessWidget {
  HomeTextFieldWithTitle({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
  });
  final String title;
  final String hintText;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: customBlackColor,
          ),
        ),
        SizedBox(height: s.height * 0.014),
        TextFormField(
          controller: controller,
          cursorColor: primaryColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: lightGreyColor,
              fontSize: 15,
            ),
            filled: true,
            fillColor: unselectedRadioColor,
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
