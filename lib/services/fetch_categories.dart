import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:ecommerce_app_with_firebase/services/fetch_products_from_firebase.dart';

Future<List<String>> fetchCategories() async {
  List<Product> products = await fetchProductsFromFirebase();
  Set<String> uniqueCategories = <String>{};

  for (Product product in products) {
    uniqueCategories.add(product.category);
  }
  List<String> categories = uniqueCategories.toList();
  return categories;
}
