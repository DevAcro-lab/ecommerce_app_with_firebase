import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

CupertinoAlertDialog buildCupertinoAlertDialog(
    {required Size s,
    required BuildContext context,
    required String title,
    content,
    buttonTitle,
    isLoading = false,
    required VoidCallback onTap,
    required IconData icon}) {
  return CupertinoAlertDialog(
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(width: s.width * 0.02),
        Text(title),
      ],
    ),
    content: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(content),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: onTap,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Text(buttonTitle),
        ),
      ),
    ],
  );
}
