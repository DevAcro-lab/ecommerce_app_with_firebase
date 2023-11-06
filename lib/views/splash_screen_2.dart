import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/constants/texts.dart';
import 'package:ecommerce_app_with_firebase/provider/toggle_splash_screen_button.dart';
import 'package:ecommerce_app_with_firebase/views/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/gender_type.dart';
import '../custom_widgets/splash_radio_button.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    // final provider = Provider.of<ToggleSplashScreenButton>(context);
    return Scaffold(
      // backgroundColor: primaryColor,
      body: Container(
        height: s.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            transform: const GradientRotation(7),
            colors: [
              primaryColor.withOpacity(0.5),
              primaryColor,
            ],
          ),
          image: const DecorationImage(
            image: AssetImage('assets/images/splash_image.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Center(
              child: Padding(
                padding: EdgeInsets.all(s.width * 0.035),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: s.width * 0.09, vertical: 30),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        splashContainerTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: customBlackColor,
                        ),
                      ),
                      SizedBox(height: s.height * 0.02),
                      const Text(
                        splashContainerSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: lightGreyColor,
                        ),
                      ),
                      SizedBox(height: s.height * 0.03),
                      Consumer<ToggleSplashScreenButton>(
                        builder: (context, provider, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReUseAbleContainer(
                                  title: 'Men',
                                  buttonColor: provider.maleContainerColor,
                                  textColor: provider.maleContainerColor ==
                                          unselectedRadioColor
                                      ? lightGreyColor
                                      : whiteColor,
                                  onTap: () {
                                    provider.toggleButton(GenderType.male);
                                  }),
                              ReUseAbleContainer(
                                  title: 'Women',
                                  buttonColor: provider.femaleContainerColor,
                                  textColor: provider.femaleContainerColor ==
                                          unselectedRadioColor
                                      ? lightGreyColor
                                      : whiteColor,
                                  onTap: () {
                                    provider.toggleButton(GenderType.female);
                                  }),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: s.height * 0.025),
                      GestureDetector(
                        onTap: () {
                          nextPageRemovePrevious(
                            context,
                            const GetStartedScreen(),
                          );
                        },
                        child: const Text(
                          splashScreenSkipText,
                          style: TextStyle(
                            color: lightGreyColor,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
