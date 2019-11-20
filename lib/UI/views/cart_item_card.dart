import 'package:flutter/material.dart';
import 'package:shopnbuy/core/models/product.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(this.product, this.quantity);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '\$${product.price.toString()}.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        '\Qty: ${quantity.toString()}',
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
                product.imageUrl,
                height: 125.0,
                width: 135.0,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
