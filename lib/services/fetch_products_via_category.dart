import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:ecommerce_app_with_firebase/services/fetch_products_from_firebase.dart';

Future<List<Product>> fetchProductsViaCategory(String categoryName) async {
  List<Product> products = await fetchProductsFromFirebase();

  List<Product> filteredProducts =
      products.where((product) => product.category == categoryName).toList();
  return filteredProducts;
}
