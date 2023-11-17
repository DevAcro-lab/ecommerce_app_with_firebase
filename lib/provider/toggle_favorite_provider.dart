import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:ecommerce_app_with_firebase/services/add_to_favorite.dart';
import 'package:ecommerce_app_with_firebase/services/clear_favorite_products_list.dart';
import 'package:ecommerce_app_with_firebase/services/fetch_favorite_products.dart';
import 'package:ecommerce_app_with_firebase/services/remove_from_favorite.dart';
import 'package:flutter/material.dart';

class ToggleFavoriteProduct extends ChangeNotifier {
  bool isLoading = false;
  bool isFav = false;
  List<Product> _favoriteProducts = [];
  int itemsCount = 0;
  List<Product> get favoriteProducts => _favoriteProducts;

  Future<List<Product>> fetchFavProducts() async {
    _favoriteProducts = await fetchFavoriteProducts();
    return _favoriteProducts;
  }

  void updateItemsCount() {
    itemsCount = _favoriteProducts.length;
  }

  Future<void> clearFavProducts() async {
    isLoading = false;
    notifyListeners();
    await clearFavoriteProductsListFromFirestore();
    _favoriteProducts.clear();
    isLoading = false;
    notifyListeners();
    updateItemsCount();
    notifyListeners();
  }

  bool isProductFavorite(Product product) {
    try {
      if (_favoriteProducts.isNotEmpty) {
        isFav = _favoriteProducts.any((item) => item.id == product.id);
        return isFav;
      } else {
        isFav = false;
        return isFav;
      }
    } catch (error) {
      print('Error during isProductFavorite: $error');
      return false;
    }
  }

  Future<void> toggleFavorite(Product product, context) async {
    try {
      final isProductInFavorites =
          _favoriteProducts.any((item) => item.id == product.id);
      if (isProductInFavorites) {
        await removeFromFirebase(product, context);
        _favoriteProducts.removeWhere((item) => item.id == product.id);
        updateItemsCount();
      } else {
        await addToFavorite(product, context);
        if (!_favoriteProducts.any((item) => item.id == product.id)) {
          _favoriteProducts.add(product);
          updateItemsCount();
        }
      }
      await fetchFavProducts();
      notifyListeners();
    } catch (e) {
      print('Error during toggleFavoriteProduct: $e');
      // Handle the error, show a snackBar, or log it
    }
  }
}
