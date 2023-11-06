import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/gender_type.dart';

class ToggleSplashScreenButton extends ChangeNotifier {
  Color maleContainerColor = unselectedRadioColor;
  Color femaleContainerColor = unselectedRadioColor;

  void toggleButton(GenderType gender) {
    if (gender == GenderType.male) {
      if (maleContainerColor == unselectedRadioColor) {
        maleContainerColor = primaryColor;
        femaleContainerColor = unselectedRadioColor;
        notifyListeners();
      } else {
        maleContainerColor = unselectedRadioColor;
        notifyListeners();
      }
    } else if (gender == GenderType.female) {
      if (femaleContainerColor == unselectedRadioColor) {
        femaleContainerColor = primaryColor;
        maleContainerColor = unselectedRadioColor;
        notifyListeners();
      } else {
        femaleContainerColor = unselectedRadioColor;
        notifyListeners();
      }
    }
  }
}
