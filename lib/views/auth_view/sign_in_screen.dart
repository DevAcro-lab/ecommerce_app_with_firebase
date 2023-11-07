import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_header_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/cupertino_alert_dialog.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/navigation_bar_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/remember_me_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_textfield_with_title.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
import 'package:ecommerce_app_with_firebase/views/auth_view/forgot_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
            SizedBox(height: s.height * 0.113),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: customBlackColor,
              ),
            ),
            const Text(
              'Please enter your data to continue',
              style: TextStyle(
                fontSize: 15,
                color: lightGreyColor,
              ),
            ),
            SizedBox(height: s.height * 0.12),
            TextFieldContainer(title: 'Email', controller: emailController),
            TextFieldContainer(
                title: 'Password', controller: passwordController),
            SizedBox(height: s.height * 0.02),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  nextPage(
                    context,
                    const ForgotPasswordScreen(),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 15, color: redColor),
                ),
              ),
            ),
            SizedBox(height: s.height * 0.02),
            RememberMeWidget(title: 'Remember Me', rememberMe: rememberMe),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      'By Connecting your account confirms that you agree with our ',
                  style: TextStyle(
                    color: lightGreyColor,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(
                        fontSize: 13,
                        color: customBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Login',
        isLoading: authProvider.isLoading,
        onTap: () {
          authProvider
              .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text)
              .then((value) => nextPageRemovePrevious(
                    context,
                    const NavigationBarWidget(),
                  ))
              .catchError(
                (error, stackTrace) => showCupertinoDialog(
                  context: context,
                  builder: (context) => buildCupertinoAlertDialog(
                    s: s,
                    context: context,
                    title: 'Account Info',
                    content: 'Wrong Credentials',
                    buttonTitle: 'Try Again',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.person_pin_outlined,
                  ),
                ),
              );
        },
      ),
    );
  }
}
