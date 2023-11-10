import 'dart:convert';
import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchResponse() async {
  const String url = "https://dummyjson.com/products?limit=100";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    final ProductsResponse productsResponse =
        ProductsResponse.fromJson(jsonData);
    return productsResponse.products;
  } else {
    throw Exception('failed to load response');
  }
}
