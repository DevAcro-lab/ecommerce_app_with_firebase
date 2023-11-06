import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/provider/toggle_splash_screen_button.dart';
import 'package:ecommerce_app_with_firebase/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ToggleSplashScreenButton()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Laza',
        theme: ThemeData(
          scaffoldBackgroundColor: whiteColor,
          primaryColor: primaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
