import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/home_header.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/remember_me_widget.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/home_textfield_with_title.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(title: 'Address'),
              SizedBox(height: s.height * 0.05),
              HomeTextFieldWithTitle(
                title: 'Name',
                hintText: 'John Wick',
                controller: nameController,
              ),
              SizedBox(height: s.height * 0.028),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: s.width * 0.44,
                    child: HomeTextFieldWithTitle(
                      title: 'Country',
                      hintText: 'Pakistan',
                      controller: countryController,
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.44,
                    child: HomeTextFieldWithTitle(
                      title: 'City',
                      hintText: 'Islamabad',
                      controller: cityController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: s.height * 0.028),
              HomeTextFieldWithTitle(
                title: 'Phone Number',
                hintText: '+923409682799',
                controller: phoneNoController,
              ),
              SizedBox(height: s.height * 0.028),
              HomeTextFieldWithTitle(
                title: 'Address',
                hintText: 'Street 11, Phase 6, Bahria Town',
                controller: addressController,
              ),
              SizedBox(height: s.height * 0.028),
              RememberMeWidget(
                  title: 'Save as primary address', rememberMe: rememberMe),
            ],
          ),
        ),
      ),
    );
  }
}
