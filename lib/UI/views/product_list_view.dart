import 'package:flutter/material.dart';
import 'package:shopnbuy/UI/views/base_view.dart';
import 'package:shopnbuy/core/enums/view_state.dart';
import 'package:shopnbuy/core/viewmodels/product_list_model.dart';

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductListModel>(
      onModelReady: (model) => model.getProducts(),
      builder: (context, model, child) => Scaffold(
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(8.0),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 5.0,
                children: model.products
                    .map((product) => Card(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Image.network(product.imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(product.name),
                                ),
                                Text(product.price.toString()),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
      ),
    );
  }
}
