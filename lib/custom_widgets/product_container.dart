import 'package:ecommerce_app_with_firebase/provider/toggle_favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../models/product.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
    required this.iconOnTap,
  });

  final Product product;
  final VoidCallback iconOnTap;

  @override
  Widget build(BuildContext context) {
    Provider.of<ToggleFavoriteProduct>(context, listen: false)
        .isProductFavorite(product);
    return Consumer<ToggleFavoriteProduct>(
      builder: (context, favProvider, child) {
        return GridTile(
          header: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: IconButton(
                splashRadius: 25,
                onPressed: iconOnTap,
                icon: Icon(
                  favProvider.isFav
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: favProvider.isFav ? redColor : lightGreyColor,
                ),
              ),
            ),
          ),
          footer: Container(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 10),
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
                  product.title,
                  style: const TextStyle(
                    fontSize: 11,
                    color: whiteColor,
                  ),
                ),
                Text(
                  product.price.toString(),
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
                fit: BoxFit.cover,
                image: NetworkImage(
                  product.thumbnail,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
