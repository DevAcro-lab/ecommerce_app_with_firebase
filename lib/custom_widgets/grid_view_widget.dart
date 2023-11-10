import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/product_container.dart';
import 'package:ecommerce_app_with_firebase/services/get_product_id_via_index.dart';
import 'package:ecommerce_app_with_firebase/views/details_screen.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.products,
    required this.s,
  });

  final List<Product>? products;
  final Size s;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: products?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: s.width * 0.03,
        childAspectRatio: 1 / 1.2,
        mainAxisSpacing: s.height * 0.02,
      ),
      itemBuilder: (context, index) {
        final product = products![index];
        return GestureDetector(
          onTap: () async {
            // final productId = await getProductIdByIndex(index);
            nextPage(
              context,
              rootNavigator: true,
              DetailsScreen(productId: product.id),
            );
          },
          child: ProductContainer(product: product),
        );
      },
    );
  }
}
