import 'package:shopnbuy/core/models/product.dart';

import 'base_model.dart';

class CartModel extends BaseModel {
  List<Product> cart = [];
  Map<String, List<Product>> cartSummary = {};

  int get cartSize {
    return cart.length;
  }

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  List<Product> getCart() {
    return cart;
  }

  Map<String, List<Product>> getCartSummary() {
    cartSummary = {};
    cart.forEach((product) {
      if (!cartSummary.keys.contains(product.name)) {
        cartSummary[product.name] = [product];
      } else {
        var currentProducts = cartSummary[product.name];
        currentProducts.add(product);
        cartSummary[product.name] = currentProducts;
      }
    });
    return cartSummary;
  }

  Product getProduct(int index) {
    var name = cartSummary.keys.elementAt(index);
    return cartSummary[name].first;
  }

  int getProductQuantity(int index) {
    var name = cartSummary.keys.elementAt(index);
    return cartSummary[name].length;
  }

  void removeFromCart(Product product) {
    cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    cart = [];
    notifyListeners();
  }
}
