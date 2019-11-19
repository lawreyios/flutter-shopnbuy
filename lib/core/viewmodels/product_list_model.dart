import 'package:shopnbuy/core/enums/view_state.dart';
import 'package:shopnbuy/core/models/product.dart';
import 'package:shopnbuy/core/services/api.dart';
import 'package:shopnbuy/helpers/dependency_assembly.dart';

import 'base_model.dart';

class ProductListModel extends BaseModel {
  API _api = dependencyAssembler<API>();

  List<Product> products;
  List<Product> cart = [];

  Future getProducts() async {
    setState(ViewState.Busy);
    products = await _api.getProducts();
    setState(ViewState.Idle);
  }

  int get cartSize {
    return cart.length;
  }

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners();
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
