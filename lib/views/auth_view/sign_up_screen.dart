import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/models/user_details.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
import 'package:ecommerce_app_with_firebase/views/add_user_details_screen.dart';
import 'package:ecommerce_app_with_firebase/views/auth_view/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/auth_header_widget.dart';
import '../../custom_widgets/cupertino_alert_dialog.dart';
import '../../custom_widgets/remember_me_widget.dart';
import '../../custom_widgets/auth_textfield_with_title.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            AuthHeaderWidget(
              title: 'Sign Up',
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(height: s.height * 0.2),
            TextFieldContainer(
              title: 'Email Address',
              controller: emailController,
            ),
            TextFieldContainer(
              title: 'Password',
              controller: passwordController,
            ),
            SizedBox(height: s.height * 0.04),
            RememberMeWidget(title: 'Remember Me', rememberMe: rememberMe),
          ],
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Sign Up',
        onTap: () {
          nextPage(
            context,
            AddUserDetailsScreen(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
        },
      ),
    );
  }
}
