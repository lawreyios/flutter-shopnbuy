import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnbuy/core/models/product.dart';
import 'package:shopnbuy/helpers/dependency_assembly.dart';
import 'package:shopnbuy/core/viewmodels/product_list_model.dart';
import 'package:shopnbuy/core/viewmodels/cart_model.dart';
import 'package:mockito/mockito.dart';
import 'package:shopnbuy/helpers/constants.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

final String mockJSONResponse =
    "[\r\n    {\r\n        \"id\": 1,\r\n        \"imageUrl\": \"https:\/\/i.imgur.com\/oYZbJFb.jpg\",\r\n        \"name\": \"MacBook Pro 16-inch model\",\r\n        \"price\": 2399\r\n    },\r\n    {\r\n        \"id\": 2,\r\n        \"imageUrl\": \"https:\/\/i.imgur.com\/b11y1Fx.jpg\",\r\n        \"name\": \"AirPods Pro\",\r\n        \"price\": 249\r\n    }\r\n]";

final Product mockProduct =
    Product(id: 1, name: "Product1", price: 111, imageUrl: "imageUrl");

void main() {
  setupDependencyAssembler();

  var productListViewModel = dependencyAssembler<ProductListModel>();
  var cartViewModel = dependencyAssembler<CartModel>();

  group('Given Product List Page Loads', () {
    test('Page should load list of products from firebase', () async {
      final client = MockClient();
      final productsData = json.decode(mockJSONResponse);

      when(client.get(URL.ProductList))
          .thenAnswer((_) async => http.Response(productsData, 200));

      await productListViewModel.getProducts();

      expect(productListViewModel.products.length, 2);

      expect(
          productListViewModel.products[0].name, 'MacBook Pro 16-inch model');
      expect(productListViewModel.products[0].price, 2399);
      expect(productListViewModel.products[1].name, 'AirPods Pro');
      expect(productListViewModel.products[1].price, 249);
    });
    test('when user adds a product to cart, cart size should increment by 1',
        () {
      cartViewModel.addToCart(mockProduct);

      expect((cartViewModel.cartSize), 1);
    });
  });
}
