import 'package:ecommerce_app_with_firebase/custom_widgets/home_header.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 17,
                    color: customBlackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: s.height * 0.04),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8072.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
