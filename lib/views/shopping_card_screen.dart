import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/home_header.dart';
import 'package:ecommerce_app_with_firebase/views/address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(title: 'Cart'),
              SizedBox(height: s.height * 0.02),
              SizedBox(
                height: s.height * 0.4,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      color: unselectedRadioColor,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8072.png"),
                                ),
                              ),
                            ),
                            SizedBox(width: s.width * 0.04),
                            SizedBox(
                              width: s.width * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Text(
                                    "Men's Tie-Dye T-shirt Nike Sportswear",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: customBlackColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: s.height * 0.019),
                                  const Text(
                                    '\$45 (-\$4.00 Tax)',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: lightGreyColor,
                                    ),
                                  ),
                                  SizedBox(height: s.height * 0.019),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 0.2,
                                              color: lightGreyColor),
                                        ),
                                        child: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: lightGreyColor,
                                        ),
                                      ),
                                      SizedBox(width: s.width * 0.03),
                                      const Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: s.width * 0.03),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 0.2,
                                            color: lightGreyColor,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: lightGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    activeColor: primaryColor,
                                    splashRadius: 10,
                                    side: const BorderSide(
                                        color: primaryColor, width: 0.2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      // side: BorderSide(
                                      //    ),
                                    ),
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                ),
                                SizedBox(height: s.height * 0.04),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 0.2,
                                      color: lightGreyColor,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(
                                    CupertinoIcons.delete_solid,
                                    color: lightGreyColor,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: s.height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: 17,
                      color: customBlackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextPage(
                        context,
                        const AddressScreen(),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: customBlackColor,
                    ),
                  ),
                ],
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image(
                  image: AssetImage('assets/images/location.png'),
                ),
                title: Text(
                  'Marghuz, District Swabi, 23430',
                  style: TextStyle(
                    fontSize: 15,
                    color: customBlackColor,
                  ),
                ),
                minVerticalPadding: 1,
                subtitle: Text(
                  'Pakistan',
                  style: TextStyle(
                    fontSize: 13,
                    color: lightGreyColor,
                  ),
                ),
                trailing: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 25,
                ),
              ),
              SizedBox(height: s.height * 0.01),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 17,
                      color: customBlackColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: customBlackColor,
                  ),
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(10.5),
                  decoration: BoxDecoration(
                    color: unselectedRadioColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Image(
                    image: AssetImage('assets/images/Frame.png'),
                  ),
                ),
                title: const Text(
                  'Visa Classic',
                  style: TextStyle(
                    fontSize: 15,
                    color: customBlackColor,
                  ),
                ),
                minVerticalPadding: 1,
                subtitle: const Text(
                  '****** 7690',
                  style: TextStyle(
                    fontSize: 13,
                    color: lightGreyColor,
                  ),
                ),
                trailing: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 25,
                ),
              ),
              SizedBox(height: s.height * 0.007),
              const Text(
                'Order Info',
                style: TextStyle(
                  fontSize: 17,
                  color: customBlackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: s.height * 0.01),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      color: lightGreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$110',
                    style: TextStyle(
                      fontSize: 15,
                      color: customBlackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: s.height * 0.01),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Cost',
                    style: TextStyle(
                      color: lightGreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$10',
                    style: TextStyle(
                      fontSize: 15,
                      color: customBlackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: s.height * 0.01),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: lightGreyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$120',
                    style: TextStyle(
                      fontSize: 15,
                      color: customBlackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
