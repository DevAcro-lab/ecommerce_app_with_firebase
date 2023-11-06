import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class RememberMeWidget extends StatefulWidget {
  RememberMeWidget({
    super.key,
    required this.rememberMe,
    required this.title,
  });

  bool rememberMe;
  final String title;

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 13,
            color: customBlackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
              value: widget.rememberMe,
              onChanged: (value) {
                setState(() {
                  widget.rememberMe = value;
                });
              }),
        )
      ],
    );
  }
}
