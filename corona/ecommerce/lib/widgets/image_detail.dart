import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final Product product;
  ImageDetail(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            product.product_name,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Rs.${product.price}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Container(
                height: 250,
                width: 250,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Hero(
                        tag: '${product.id}',
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                        ))),
              )
            ],
          )
        ],
      ),
    );
  }
}
