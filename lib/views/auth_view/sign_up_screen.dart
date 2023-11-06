import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/auth_header_widget.dart';
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
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: s.height * 0.15),
            TextFieldContainer(
              title: 'Username',
              controller: usernameController,
              spacing: true,
            ),
            TextFieldContainer(
              title: 'Password',
              controller: passwordController,
            ),
            TextFieldContainer(
              title: 'Email Address',
              controller: emailController,
            ),
            SizedBox(height: s.height * 0.04),
            RememberMeWidget(title: 'Remember Me', rememberMe: rememberMe),
          ],
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Sign Up',
        onTap: () {},
      ),
    );
  }
}
