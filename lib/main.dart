import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/firebase_options.dart';
import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
import 'package:ecommerce_app_with_firebase/provider/product_notifier.dart';
import 'package:ecommerce_app_with_firebase/provider/toggle_splash_screen_button.dart';
import 'package:ecommerce_app_with_firebase/services/add_products_to_firebase.dart';
import 'package:ecommerce_app_with_firebase/services/get_json_response.dart';
import 'package:ecommerce_app_with_firebase/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final products = await fetchResponse();
  // await addProductsToFirebase(products);
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
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // ChangeNotifierProvider(create: (_) => ProductNotifier()),
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
