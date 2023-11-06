import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddReviewScreen extends StatelessWidget {
  AddReviewScreen({Key? key}) : super(key: key);

  double rating = 2.5;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(title: 'Add Review'),
              SizedBox(height: s.height * 0.04),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 17,
                  color: customBlackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: s.height * 0.01),
              TextField(
                cursorColor: primaryColor,
                style: const TextStyle(
                  color: customBlackColor,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 0.01),
                  ),
                  hintText: 'Type your name',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: lightGreyColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  filled: true,
                  fillColor: unselectedRadioColor,
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: s.height * 0.04),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 17,
                  color: customBlackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: s.height * 0.01),
              const TextField(
                cursorColor: primaryColor,
                style: TextStyle(
                  color: customBlackColor,
                ),
                maxLines: 12,
                decoration: InputDecoration(
                  hintText: 'Describe your experience?',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: lightGreyColor,
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
                  filled: true,
                  fillColor: unselectedRadioColor,
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: s.height * 0.05),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Give Star',
                  style: TextStyle(
                    fontSize: 17,
                    color: customBlackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: s.height * 0.01),
              Align(
                alignment: Alignment.center,
                child: RatingBar.builder(
                  itemBuilder: (context, _) {
                    return const Icon(
                      Icons.star,
                      color: ratingItemColor,
                    );
                  },
                  onRatingUpdate: (value) {
                    rating = value;
                  },
                  itemSize: 35,
                  initialRating: rating,
                  allowHalfRating: true,
                  unratedColor: ratingItemColor.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Submit Review',
        onTap: () {},
      ),
    );
  }
}
