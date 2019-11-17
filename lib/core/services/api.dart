import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopnbuy/core/models/product.dart';

class API {
  static const endpoint = 'https://shopnbuy-48859.firebaseio.com/products.json';

  var client = new http.Client();

  Future<List<Product>> getProducts() async {
    var products = List<Product>();
    var response = await client.get('$endpoint');

    var data = json.decode(response.body) as List<dynamic>;

    print(data);

    // loop and convert each item to Post
    for (var product in data) {
      products.add(Product.fromJson(product));
    }

    return products;
  }
}
