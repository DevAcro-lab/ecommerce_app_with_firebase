import 'package:ecommerce_app_with_firebase/custom_widgets/cupertino_alert_dialog.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/grid_view_widget.dart';
import 'package:ecommerce_app_with_firebase/provider/toggle_favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ToggleFavoriteProduct>(context, listen: false)
        .fetchFavProducts();
    Provider.of<ToggleFavoriteProduct>(context, listen: false)
        .updateItemsCount();
    print("Fetch products fetched");
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Wishlist",
                style: TextStyle(
                  fontSize: 17,
                  color: customBlackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Consumer<ToggleFavoriteProduct>(
                  builder: (context, productProvider, child) {
                    if (productProvider.favoriteProducts.isEmpty) {
                      return const Center(
                        child: Text('No Products in Favorite List'),
                      );
                    } else {
                      final products = productProvider.favoriteProducts;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: s.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${productProvider.itemsCount} Items",
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                        color: customBlackColor),
                                  ),
                                  SizedBox(height: s.height * 0.008),
                                  const Text(
                                    'in Wishlist',
                                    style: TextStyle(
                                        fontSize: 14, color: lightGreyColor),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return buildCupertinoAlertDialog(
                                          s: s,
                                          context: context,
                                          title: "Clear All Favorite List",
                                          buttonTitle: 'Clear All',
                                          isLoading: productProvider.isLoading,
                                          content:
                                              'Want to remove all favorite products?',
                                          onTap: () async {
                                            await productProvider
                                                .clearFavProducts();
                                            Navigator.pop(context);
                                          },
                                          icon: Icons.delete_outline,
                                        );
                                      });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: unselectedRadioColor,
                                  ),
                                  child: const Text(
                                    'Clear All',
                                    style: TextStyle(color: customBlackColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: s.height * 0.02),
                          Expanded(
                            child: GridViewWidget(products: products, s: s),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
