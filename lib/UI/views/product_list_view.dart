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
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            title: Text("ShopNBuy"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              )
            ],
          ),
          body: model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          child: Card(
                            elevation: 4.0,
                            margin: new EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 6.0),
                            child: Container(
                              height: 150.0,
                              decoration: BoxDecoration(color: Colors.white),
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            model.products[index].name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                '\$${model.products[index].price.toString()}.00',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                    Icons.add_shopping_cart),
                                                color: Colors.grey,
                                                onPressed: () {},
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.grey.shade100,
                                      width: 2.0,
                                      height: 130.0,
                                    ),
                                    Image.network(
                                      model.products[index].imageUrl,
                                      height: 100.0,
                                      width: 100.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(10.0),
                        ),
                      ],
                    );
                  },
                  itemCount: model.products.length,
                )),
    );
  }
}
