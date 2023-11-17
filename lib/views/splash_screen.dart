import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/navigation_bar_widget.dart';
import 'package:ecommerce_app_with_firebase/models/user.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
import 'package:ecommerce_app_with_firebase/views/auth_view/sign_in_screen.dart';
import 'package:ecommerce_app_with_firebase/views/bottom_navigation_screens/home_screen.dart';
import 'package:ecommerce_app_with_firebase/views/splash_screen_2.dart';
import 'package:ecommerce_app_with_firebase/views/wrapper_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const Wrapper(),
            ),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: ImageIcon(
          AssetImage('assets/images/Logo.png'),
          size: 40,
          color: whiteColor,
        ),
      ),
    );
  }
}
