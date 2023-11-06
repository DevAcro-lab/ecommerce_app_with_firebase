import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/constants/texts.dart';
import 'package:ecommerce_app_with_firebase/views/auth_view/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/auth_header_widget.dart';
import '../custom_widgets/custom_auth_button.dart';
import '../custom_widgets/social_container.dart';
import 'auth_view/sign_up_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            AuthHeaderWidget(
              title: getStarted,
              onTap: () {},
            ),
            SizedBox(height: s.height * 0.2),
            SocialContainer(
              title: 'Facebook',
              containerColor: blueColor,
              imgUrl: 'assets/images/fb.png',
              onTap: () {},
            ),
            SocialContainer(
              title: 'Twitter',
              containerColor: skyColor,
              imgUrl: 'assets/images/twitter.png',
              onTap: () {},
            ),
            SocialContainer(
              title: 'Google',
              containerColor: redColor,
              imgUrl: 'assets/images/google.png',
              onTap: () {},
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(
                  fontSize: 15,
                  color: lightGreyColor,
                ),
                children: [
                  TextSpan(
                    text: 'Signin',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        nextPage(
                          context,
                          const SignInScreen(),
                        );
                      },
                    style: const TextStyle(
                      fontSize: 15,
                      color: customBlackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Create Account',
        onTap: () {
          nextPage(
            context,
            const SignUpScreen(),
          );
        },
      ),
    );
  }
}
