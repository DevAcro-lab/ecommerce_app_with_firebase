import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_header_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/views/auth_view/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OPTVerificationScreen extends StatefulWidget {
  const OPTVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OPTVerificationScreen> createState() => _OPTVerificationScreenState();
}

class _OPTVerificationScreenState extends State<OPTVerificationScreen> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secController = TextEditingController();
  final TextEditingController thirdController = TextEditingController();
  final TextEditingController forthController = TextEditingController();
  final TextEditingController fifthController = TextEditingController();
  final TextEditingController sixthController = TextEditingController();
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
                title: 'Verification Code'),
            SizedBox(height: s.height * 0.07),
            const Image(
              image: AssetImage('assets/images/forgot_pass_screen_image.png'),
            ),
            SizedBox(height: s.height * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpInput(
                  autoFocus: true,
                  controller: firstController,
                ),
                SizedBox(width: s.width * 0.02),
                OtpInput(
                  autoFocus: false,
                  controller: secController,
                ),
                SizedBox(width: s.width * 0.02),
                OtpInput(
                  autoFocus: false,
                  controller: thirdController,
                ),
                SizedBox(width: s.width * 0.02),
                OtpInput(
                  autoFocus: false,
                  controller: forthController,
                ),
                SizedBox(width: s.width * 0.02),
                OtpInput(
                  autoFocus: false,
                  controller: fifthController,
                ),
                SizedBox(width: s.width * 0.02),
                OtpInput(
                  autoFocus: false,
                  controller: sixthController,
                ),
              ],
            ),
            const Spacer(),
            RichText(
              text: const TextSpan(
                  text: '00:20 ',
                  style: TextStyle(
                    fontSize: 13,
                    color: customBlackColor,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: 'resend confirmation code',
                      style: TextStyle(
                        fontSize: 13,
                        color: lightGreyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Confirm Code',
        onTap: () {
          nextPage(
            context,
            const NewPasswordScreen(),
          );
        },
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  const OtpInput({
    super.key,
    required this.controller,
    required this.autoFocus,
  });

  final TextEditingController controller;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: textFieldBorderColor,
        ),
      ),
      width: s.width * 0.13,
      height: s.height * 0.1,
      child: Center(
        child: TextFormField(
          controller: controller,
          autofocus: autoFocus,
          maxLength: 1,
          cursorColor: primaryColor,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, color: customBlackColor),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
