import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/custom_auth_button.dart';
import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:ecommerce_app_with_firebase/services/product_details_via_id.dart';
import 'package:ecommerce_app_with_firebase/views/reviews_screen.dart';
import 'package:ecommerce_app_with_firebase/views/shopping_card_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.productId}) : super(key: key);
  final String productId;

  double rating = 1;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: productDetailsViaID(productId),
            builder: (context, snapshot) {
              final product = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong.'),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('No product details for now'),
                );
              } else {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      height: s.height * 0.22,
                      decoration: BoxDecoration(
                        color: unselectedRadioColor,
                        image: DecorationImage(
                          image: NetworkImage(product!.thumbnail),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                color: customBlackColor,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              nextPage(
                                context,
                                const ShoppingCartScreen(),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: customBlackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: s.height * 0.014),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.brand,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: lightGreyColor,
                                    ),
                                  ),
                                  SizedBox(height: s.height * 0.006),
                                  Text(
                                    product.title.length > 25
                                        ? product.title.substring(0, 26)
                                        : product.title,
                                    style: const TextStyle(
                                      fontSize: 21,
                                      color: customBlackColor,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Price",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: lightGreyColor,
                                    ),
                                  ),
                                  SizedBox(height: s.height * 0.006),
                                  Text(
                                    '\$${product.price}',
                                    style: const TextStyle(
                                      fontSize: 21,
                                      color: customBlackColor,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: s.height * 0.013),
                          SizedBox(
                            height: s.height * 0.1,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.images.length,
                                itemBuilder: (context, index) {
                                  final imageUrl = snapshot.data!.images[index];
                                  return OtherPictureContainer(
                                      imageUrl: imageUrl);
                                }),
                          ),
                          SizedBox(height: s.height * 0.013),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Size',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: customBlackColor,
                                ),
                              ),
                              Text(
                                'Size Guide',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: lightGreyColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: s.height * 0.008),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizeContainer(title: 'S', onTap: () {}),
                              SizeContainer(title: 'M', onTap: () {}),
                              SizeContainer(title: 'L', onTap: () {}),
                              SizeContainer(title: 'XL', onTap: () {}),
                              SizeContainer(title: '2XL', onTap: () {}),
                            ],
                          ),
                          SizedBox(height: s.height * 0.011),
                          const Text(
                            'Description',
                            style: TextStyle(
                              color: customBlackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: s.height * 0.008),
                          ReadMoreText(
                            product.description,
                            style: const TextStyle(
                              fontSize: 15,
                              color: lightGreyColor,
                            ),
                            trimLines: 3,
                            trimMode: TrimMode.Line,
                            lessStyle: const TextStyle(
                              fontSize: 15,
                              color: customBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            moreStyle: const TextStyle(
                              fontSize: 15,
                              color: customBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            trimCollapsedText: ' Read more',
                            trimExpandedText: ' Show Less',
                          ),
                          SizedBox(height: s.height * 0.008),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Reviews',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: customBlackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  nextPage(context, ReviewsScreen(),
                                      rootNavigator: true);
                                },
                                child: const Text(
                                  'View All',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: lightGreyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: s.height * 0.006),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8076.png',
                              ),
                            ),
                            title: const Text(
                              'Ronald Richards',
                              style: TextStyle(
                                color: customBlackColor,
                              ),
                            ),
                            subtitle: const Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 15,
                                ),
                                Text(
                                  ' 13 Sep, 2020',
                                  style: TextStyle(
                                    color: lightGreyColor,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              children: [
                                SizedBox(height: s.height * 0.012),
                                RichText(
                                  text: const TextSpan(
                                    text: '4.8',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: customBlackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      WidgetSpan(
                                        child: SizedBox(width: 6),
                                      ),
                                      TextSpan(
                                        text: 'rating',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: lightGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: s.height * 0.005),
                                RatingBar.builder(
                                  itemBuilder: (context, _) {
                                    return const Icon(
                                      Icons.star,
                                      color: ratingItemColor,
                                    );
                                  },
                                  onRatingUpdate: (value) {
                                    rating = value;
                                  },
                                  itemSize: 13,
                                  initialRating: rating,
                                  allowHalfRating: true,
                                  unratedColor:
                                      ratingItemColor.withOpacity(0.2),
                                ),
                              ],
                            ),
                          ),
                          const ReadMoreText(
                            "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                            trimExpandedText: ' Show less',
                            trimCollapsedText: 'Read more',
                            lessStyle: TextStyle(
                              color: customBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            moreStyle: TextStyle(
                              color: customBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            trimMode: TrimMode.Line,
                            trimLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              color: lightGreyColor,
                            ),
                          ),
                          SizedBox(height: s.height * 0.014),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Total Price',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: customBlackColor,
                                    ),
                                  ),
                                  SizedBox(height: s.height * 0.006),
                                  const Text(
                                    'with VAT,SD',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: lightGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: customBlackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomAuthButton(
        title: 'Add to Card',
        onTap: () {},
      ),
    );
  }
}

class OtherPictureContainer extends StatelessWidget {
  const OtherPictureContainer({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: unselectedRadioColor,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SizeContainer extends StatelessWidget {
  const SizeContainer({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: unselectedRadioColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
