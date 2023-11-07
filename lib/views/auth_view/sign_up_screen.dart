import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
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
    final authProvider = Provider.of<AuthProvider>(context);
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
        isLoading: authProvider.isLoading,
        onTap: () {
          authProvider
              .createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              )
              .then((value) => showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return buildCupertinoAlertDialog(
                      context: context,
                      s: s,
                      title: 'Account Info',
                      content: 'Account created successfully',
                      icon: Icons.person_pin_outlined,
                      buttonTitle: 'Go back to Login screen',
                      onTap: () => nextPageRemovePrevious(
                        context,
                        const SignInScreen(),
                      ),
                    );
                  }))
              .catchError(
                (error, stackTrace) => showCupertinoDialog(
                  context: context,
                  builder: (context) => buildCupertinoAlertDialog(
                    context: context,
                    s: s,
                    title: 'Account Info',
                    content: 'Already have an Account with this email',
                    icon: Icons.person_pin_outlined,
                    buttonTitle: 'Try Another Email',
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              )
              .onError(
                (error, stackTrace) => showCupertinoDialog(
                  context: context,
                  builder: (context) => buildCupertinoAlertDialog(
                    context: context,
                    s: s,
                    title: 'Account Info',
                    content: 'Account creation failed',
                    icon: Icons.person_pin_outlined,
                    buttonTitle: 'Try Again',
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              );
        },
      ),
    );
  }
}
