import 'package:flutter/material.dart';
import 'package:shopnbuy/core/viewmodels/cart_model.dart';

class CartView extends StatelessWidget {
  final CartModel model;

  CartView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("ShopNBuy's Cart"),
        actions: <Widget>[],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Padding(
                child: Card(
                  elevation: 4.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                  child: Container(
                    height: 150.0,
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    model.getProduct(index).name,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    '\$${model.getProduct(index).price.toString()}.00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    '\Qty: ${model.getProductQuantity(index).toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey.shade100,
                            width: 2.0,
                            height: 130.0,
                          ),
                          Image.network(
                            model.getProduct(index).imageUrl,
                            height: 125.0,
                            width: 135.0,
                            fit: BoxFit.fitHeight,
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
        itemCount: model.getCartSummary().keys.length,
      ),
    );
  }
}
