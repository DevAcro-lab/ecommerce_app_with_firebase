import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/drawer_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/header_container.dart';
import 'package:ecommerce_app_with_firebase/views/details_screen.dart';
import 'package:ecommerce_app_with_firebase/views/shopping_card_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/brand_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> clothingBrands = [
    {
      'name': 'Adidas',
      'imgUrl': 'assets/images/adidas.png',
    },
    {
      'name': 'Nike',
      'imgUrl': 'assets/images/nike.png',
    },
    {
      'name': 'Fila',
      'imgUrl': 'assets/images/fila.png',
    },
    {
      'name': 'Puma',
      'imgUrl': 'assets/images/puma.png',
    },
    {
      'name': 'Under Armour',
      'imgUrl': 'assets/images/under.png',
    },
    {
      'name': 'Reebok',
      'imgUrl': 'assets/images/reebok.png',
    },
    {
      'name': 'New Balance',
      'imgUrl': 'assets/images/newbalance.png',
    },
    {
      'name': 'Converse',
      'imgUrl': 'assets/images/converse.png',
    },
    {
      'name': 'Vans',
      'imgUrl': 'assets/images/vans.png',
    },
    {
      'name': 'Tommy Hilfiger',
      'imgUrl': 'assets/images/tommy.png',
    },
  ];

  List<Map<String, dynamic>> menDressedImages = [
    {
      'dressName': 'Formal Suit',
      'price': '\$299.99',
      'imgUrl':
          'https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8115.png',
    },
    {
      'dressName': 'Casual Jeans and T-Shirt',
      'price': '\$49.99',
      'imgUrl':
          'https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8071.png',
    },
    {
      'dressName': 'Sports Attire',
      'price': '\$79.99',
      'imgUrl':
          'https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8072.png',
    },
    {
      'dressName': 'Business Shirt and Tie',
      'price': '\$59.99',
      'imgUrl':
          'https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8097.png',
    },
    {
      'dressName': 'Winter Jacket',
      'price': '\$89.99',
      'imgUrl':
          'https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8076.png',
    },
    {
      'dressName': 'Swim Shorts',
      'price': '\$29.99',
      'imgUrl':
          'https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8086.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) {
                    return HeaderContainer(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icons.menu_open_outlined,
                    );
                  },
                ),
                HeaderContainer(
                  onTap: () {
                    nextPage(
                      context,
                      const ShoppingCartScreen(),
                    );
                  },
                  icon: Icons.shopping_bag_outlined,
                ),
              ],
            ),
            SizedBox(height: s.height * 0.02),
            const Text(
              'Hello',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: customBlackColor,
              ),
            ),
            const Text(
              'Welcome to Laza.',
              style: TextStyle(
                color: lightGreyColor,
                fontSize: 15,
              ),
            ),
            SizedBox(height: s.height * 0.022),
            Row(
              children: [
                Container(
                  height: s.height * 0.06,
                  width: s.width * 0.75,
                  decoration: BoxDecoration(
                    color: unselectedRadioColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          size: 22,
                          color: lightGreyColor,
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: lightGreyColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: s.width * 0.02),
                Expanded(
                  child: Container(
                    height: s.height * 0.06,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.send_outlined,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: s.height * 0.022),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Brand',
                  style: TextStyle(
                    fontSize: 17,
                    color: customBlackColor,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 13,
                    color: lightGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: s.height * 0.022),
            SizedBox(
              height: s.height * 0.057,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: clothingBrands.length,
                itemBuilder: (context, index) {
                  return BrandContainer(
                    title: clothingBrands[index]['name'],
                    imgUrl: clothingBrands[index]['imgUrl'],
                    onTap: () {},
                  );
                },
              ),
            ),
            SizedBox(height: s.height * 0.022),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Arrival',
                  style: TextStyle(
                    fontSize: 17,
                    color: customBlackColor,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 13,
                    color: lightGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: s.height * 0.022),
            Flexible(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: menDressedImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: s.width * 0.03,
                  childAspectRatio: 1 / 1.2,
                  mainAxisSpacing: s.height * 0.02,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final url = menDressedImages[index]['imgUrl'];
                      final name = menDressedImages[index]['dressName'];
                      final price = menDressedImages[index]['price'];

                      nextPage(
                        context,
                        DetailsScreen(url: url, name: name, price: price),
                        rootNavigator: true,
                      );
                    },
                    child: GridTile(
                      header: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: IconButton(
                            splashRadius: 25,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: lightGreyColor,
                            ),
                          ),
                        ),
                      ),
                      footer: Container(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 15, right: 10),
                        decoration: BoxDecoration(
                          color: lightGreyColor.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menDressedImages[index]['dressName'],
                              style: const TextStyle(
                                fontSize: 11,
                                color: whiteColor,
                              ),
                            ),
                            Text(
                              menDressedImages[index]['price'],
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: unselectedRadioColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              menDressedImages[index]['imgUrl'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
