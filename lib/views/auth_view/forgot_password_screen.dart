import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_header_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/cupertino_alert_dialog.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_textfield_with_title.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
import 'package:ecommerce_app_with_firebase/views/auth_view/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

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
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'Forgot Password'),
            SizedBox(height: s.height * 0.07),
            const Image(
              image: AssetImage('assets/images/forgot_pass_screen_image.png'),
            ),
            SizedBox(height: s.height * 0.1),
            TextFieldContainer(
                title: 'Email Address', controller: emailController),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Please write your email to receive a confirmation code to set a new password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: lightGreyColor,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Confirm Mail',
        onTap: () {
          authProvider
              .forgotPassword(emailController.text)
              .then(
                (value) => showCupertinoDialog(
                  context: context,
                  builder: (context) => buildCupertinoAlertDialog(
                      s: s,
                      context: context,
                      title: 'Reset Password',
                      onTap: () {
                        nextPageRemovePrevious(
                          context,
                          const SignInScreen(),
                        );
                      },
                      buttonTitle: 'Go back',
                      icon: Icons.lock_outline,
                      content: 'Password Reset Email Sent'),
                ),
              )
              .catchError(
                (error, stackTrace) => showCupertinoDialog(
                  context: context,
                  builder: (context) => buildCupertinoAlertDialog(
                    s: s,
                    context: context,
                    title: 'Account Info',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.lock_outline_rounded,
                    content: "Please enter a registered email",
                    buttonTitle: 'Try Again',
                  ),
                ),
              );
        },
      ),
    );
  }
}
