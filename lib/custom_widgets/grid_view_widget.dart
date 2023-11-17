import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/product_container.dart';
import 'package:ecommerce_app_with_firebase/provider/toggle_favorite_provider.dart';
import 'package:ecommerce_app_with_firebase/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({
    super.key,
    required this.products,
    required this.s,
  });

  final List<Product>? products;
  final Size s;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: widget.products?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: widget.s.width * 0.03,
        childAspectRatio: 1 / 1.2,
        mainAxisSpacing: widget.s.height * 0.02,
      ),
      itemBuilder: (context, index) {
        final product = widget.products![index];
        return GestureDetector(
          onTap: () {
            // final productId = await getProductIdByIndex(index);
            nextPage(
              context,
              rootNavigator: true,
              DetailsScreen(productId: product.id),
            );
          },
          child: Consumer<ToggleFavoriteProduct>(
            builder: (context, favProvider, child) {
              return ProductContainer(
                product: product,
                iconOnTap: () {
                  favProvider.toggleFavorite(product, context);
                },
              );
            },
          ),
        );
      },
    );
  }
}
