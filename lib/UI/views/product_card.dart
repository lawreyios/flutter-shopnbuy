import 'package:flutter/material.dart';
import 'package:shopnbuy/core/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product);

  final Product product;

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
                      Row(
                        children: <Widget>[
                          Text(
                            '\$${product.price.toString()}.00',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18.0,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            color: Colors.grey,
                            onPressed: () {},
                          )
                        ],
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
