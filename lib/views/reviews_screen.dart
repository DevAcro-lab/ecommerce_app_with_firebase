import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/views/add_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

import '../constants/colors.dart';
import '../custom_widgets/home_header.dart';

class ReviewsScreen extends StatelessWidget {
  ReviewsScreen({Key? key}) : super(key: key);

  double rating = 3;
  List<Map<String, dynamic>> reviews = [
    {
      'reviewerName': 'Alice Smith',
      'postedTime': '13 Sept, 2022',
      'ratingValue': 4,
      'reviewContent':
          "Great product! I love it. I'm extremely satisfied with my purchase and will definitely buy from this brand again.",
      'reviewerProfilePic':
          'https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?cs=srgb&dl=pexels-jack-winbow-1559486.jpg&fm=jpg',
    },
    {
      'reviewerName': 'Bob Johnson',
      'postedTime': '15 Sept, 2022',
      'ratingValue': 5,
      'reviewContent':
          "Fantastic service, highly recommended. This product exceeded my expectations in every way. I'm extremely satisfied with my purchase and will definitely buy from this brand again. It's a game-changer!",
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
    {
      'reviewerName': 'Charlie Brown',
      'postedTime': '18 Sept, 2022',
      'ratingValue': 3,
      'reviewContent':
          "Decent but could be improved. I'm extremely satisfied with my purchase and will definitely buy from this brand again.",
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
    {
      'reviewerName': 'David Davis',
      'postedTime': '21 Sept, 2022',
      'ratingValue': 4,
      'reviewContent':
          "Satisfied with the purchase. I'm extremely satisfied with my purchase and will definitely buy from this brand again.",
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
    {
      'reviewerName': 'Eve Wilson',
      'postedTime': '23 Sept, 2022',
      'ratingValue': 2,
      'reviewContent':
          "Not as expected. Disappointed. I'm extremely satisfied with my purchase and will definitely buy from this brand again.",
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
    {
      'reviewerName': 'Frank White',
      'postedTime': '25 Sept, 2022',
      'ratingValue': 4,
      'reviewContent':
          "Good value for the price. I'm extremely satisfied with my purchase and will definitely buy from this brand again.",
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
    {
      'reviewerName': 'Grace Taylor',
      'postedTime': '27 Sept, 2022',
      'ratingValue': 5,
      'reviewContent':
          "Outstanding product! I'm extremely satisfied with my purchase and will definitely buy from this brand again.",
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
    {
      'reviewerName': 'Hank Johnson',
      'postedTime': '29 Sept, 2022',
      'ratingValue': 3,
      'reviewContent': 'It\'s alright.',
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
    {
      'reviewerName': 'Ivy Parker',
      'postedTime': '1 Oct, 2022',
      'ratingValue': 4,
      'reviewContent': 'Really happy with my purchase.',
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
    {
      'reviewerName': 'Jack Miller',
      'postedTime': '4 Oct, 2022',
      'ratingValue': 2,
      'reviewContent':
          'Not worth the money. This product did not meet my expectations, and I regret buying it. I expected much more for the price I paid. I hope they improve the quality in the future.',
      'reviewerProfilePic':
          'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3-768x464.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(title: 'Reviews'),
              SizedBox(height: s.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '245 Reviews',
                        style: TextStyle(
                          fontSize: 15,
                          color: customBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: s.height * 0.005),
                      Row(
                        children: [
                          const Text(
                            '4.8',
                            style: TextStyle(
                              fontSize: 13,
                              color: customBlackColor,
                            ),
                          ),
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
                            itemSize: 11,
                            initialRating: rating,
                            allowHalfRating: true,
                            unratedColor: ratingItemColor.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      nextPage(
                        context,
                        AddReviewScreen(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orangeColor,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.rate_review_outlined,
                          size: 17,
                        ),
                        SizedBox(width: s.width * 0.013),
                        const Text('Add Review'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: s.height * 0.02),
              Expanded(
                child: ListView.builder(
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                reviews[index]['reviewerProfilePic'],
                              ),
                            ),
                            title: Text(
                              reviews[index]['reviewerName'],
                              style: const TextStyle(
                                color: customBlackColor,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                const Icon(
                                  Icons.access_time_rounded,
                                  size: 15,
                                ),
                                Text(
                                  '  ${reviews[index]['postedTime']}',
                                  style: const TextStyle(
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
                                  text: TextSpan(
                                    text: reviews[index]['ratingValue']
                                        .toDouble()
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: customBlackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: const [
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
                                  initialRating:
                                      reviews[index]['ratingValue'].toDouble(),
                                  allowHalfRating: true,
                                  unratedColor:
                                      ratingItemColor.withOpacity(0.2),
                                ),
                              ],
                            ),
                          ),
                          ReadMoreText(
                            reviews[index]['reviewContent'],
                            trimExpandedText: ' Show less',
                            trimCollapsedText: 'Read more',
                            lessStyle: const TextStyle(
                              color: customBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            moreStyle: const TextStyle(
                              color: customBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            trimMode: TrimMode.Line,
                            trimLines: 2,
                            style: const TextStyle(
                              fontSize: 15,
                              color: lightGreyColor,
                            ),
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
