import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_header_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_textfield_with_title.dart';
import 'package:flutter/material.dart';
import 'otp_verification_screen.dart';

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
    return Scaffold(
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
          nextPage(
            context,
            const OPTVerificationScreen(),
          );
        },
      ),
    );
  }
}
