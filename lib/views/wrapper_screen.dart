import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/navigation_bar_widget.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
import 'package:ecommerce_app_with_firebase/views/bottom_navigation_screens/home_screen.dart';
import 'package:ecommerce_app_with_firebase/views/splash_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return StreamBuilder<UserModel?>(
      stream: authProvider.user,
      builder: (_, AsyncSnapshot<UserModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserModel? user = snapshot.data;
          return user == null
              ? const SplashScreen2()
              : const NavigationBarWidget();
        } else {
          return const Scaffold(
            backgroundColor: primaryColor,
            body: Center(
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            ),
          );
        }
      },
    );
  }
}
