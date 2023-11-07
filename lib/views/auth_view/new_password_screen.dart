import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_header_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/navigation_bar_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_textfield_with_title.dart';
import 'package:ecommerce_app_with_firebase/views/home_screen.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
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
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'New Password'),
            SizedBox(height: s.height * 0.2),
            TextFieldContainer(title: 'Password', controller: passController),
            TextFieldContainer(
                title: 'Confirm Password', controller: confirmPassController),
            const Spacer(),
            const Text(
              'Please write your new password',
              style: TextStyle(
                fontSize: 13,
                color: lightGreyColor,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Reset Password',
        onTap: () {
          nextPageRemovePrevious(
            context,
            const NavigationBarWidget(),
          );
        },
      ),
    );
  }
}
