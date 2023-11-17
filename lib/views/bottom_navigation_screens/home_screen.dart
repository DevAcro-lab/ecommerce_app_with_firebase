import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/drawer_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/header_container.dart';
import 'package:ecommerce_app_with_firebase/services/fetch_categories.dart';
import 'package:ecommerce_app_with_firebase/services/fetch_products_from_firebase.dart';
import 'package:ecommerce_app_with_firebase/views/category_via_products_screen.dart';
import 'package:ecommerce_app_with_firebase/views/shopping_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/brand_container.dart';
import '../../custom_widgets/grid_view_widget.dart';
import '../../provider/toggle_favorite_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ToggleFavoriteProduct>(context, listen: false)
        .fetchFavProducts();
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
              child: FutureBuilder(
                future: fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Text(
                        'Please wait loading categories',
                        style: TextStyle(
                          color: customBlackColor,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    final categories = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories!.length,
                      itemBuilder: (context, index) {
                        return BrandContainer(
                          title: categories[index],
                          imgUrl:
                              "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8072.png",
                          onTap: () {
                            nextPage(
                              context,
                              ProductsViaCategory(
                                  categoryName: categories[index]),
                            );
                          },
                        );
                      },
                    );
                  }
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
              child: FutureBuilder(
                future: fetchProductsFromFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    final products = snapshot.data;
                    return GridViewWidget(
                      products: products,
                      s: s,
                    );
                  }
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
