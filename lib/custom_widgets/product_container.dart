import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/product.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GridTile(
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
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 10),
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
  }
}
