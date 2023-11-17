import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_header_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/auth_textfield_with_title.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/navigation_bar_widget.dart';
import 'package:ecommerce_app_with_firebase/models/user_details.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
import 'package:ecommerce_app_with_firebase/services/add_user_details.dart';
import 'package:ecommerce_app_with_firebase/views/auth_view/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/routes.dart';
import '../custom_widgets/cupertino_alert_dialog.dart';

class AddUserDetailsScreen extends StatelessWidget {
  final String email, password;
  AddUserDetailsScreen({Key? key, required this.email, required this.password})
      : super(key: key);

  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              AuthHeaderWidget(
                onTap: () {},
                title: 'User Details',
              ),
              SizedBox(height: s.height * 0.1),
              TextFieldContainer(
                title: 'Username',
                controller: usernameController,
              ),
              TextFieldContainer(
                title: 'Phone Number',
                controller: phoneNumberController,
              ),
              TextFieldContainer(
                title: 'Delivery Address',
                controller: addressController,
              ),
              TextFieldContainer(
                title: 'Postal Code',
                controller: postalCodeController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Add Details',
        isLoading: authProvider.isLoading,
        onTap: () async {
          await authProvider
              .createUserWithEmailAndPassword(
                email: email,
                password: password,
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
          String id = FirebaseAuth.instance.currentUser!.uid ?? '';
          print("USER ID: $id");
          if (id.isNotEmpty) {
            await addUser(
              id: id,
              userDetails: UserDetails(
                username: usernameController.text,
                email: email,
                phoneNumber: phoneNumberController.text,
                deliveryAddress: addressController.text,
                postalCode: postalCodeController.text,
              ),
            )
                .then(
                  (value) => showCupertinoDialog(
                    context: context,
                    builder: (context) => buildCupertinoAlertDialog(
                      context: context,
                      s: s,
                      title: 'Account Info',
                      content: 'Account created successfully',
                      icon: Icons.person_pin_outlined,
                      buttonTitle: 'Go back to Login page',
                      onTap: () => nextPageRemovePrevious(
                        context,
                        const SignInScreen(),
                      ),
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
          }
        },
      ),
    );
  }
}
