import 'package:flutter/material.dart';
import 'package:storapp/models/product_model.dart';
import 'package:storapp/pages/updata_product.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product, Key? key}) : super(key: key);
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdataProductPage.id,arguments: product);
      },
      child: 
      Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.2),
                offset: Offset(10, 10))
          ]),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 7),
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
            top: -65,
            right: 32,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ))
      ]),
    );
  }
}
