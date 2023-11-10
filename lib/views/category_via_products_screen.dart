import 'package:ecommerce_app_with_firebase/custom_widgets/grid_view_widget.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/home_header.dart';
import 'package:ecommerce_app_with_firebase/services/fetch_products_via_category.dart';
import 'package:flutter/material.dart';

class ProductsViaCategory extends StatelessWidget {
  const ProductsViaCategory({Key? key, required this.categoryName})
      : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 5),
          child: Column(
            children: [
              HomeHeader(title: categoryName),
              SizedBox(height: s.height * 0.04),
              Expanded(
                child: FutureBuilder(
                  future: fetchProductsViaCategory(categoryName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something went wrong!'),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No products found for this category'),
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
      ),
    );
  }
}
