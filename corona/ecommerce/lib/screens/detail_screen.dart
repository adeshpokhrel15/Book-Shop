import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/widgets/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../providers/cart_provider.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  DetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.3),
            padding: EdgeInsets.only(top: height * 0.12, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 200,
                  child: SingleChildScrollView(
                      child: Text(
                    product.product_detail,
                    style: TextStyle(height: 1.5, color: Colors.black87),
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: Consumer(builder: (context, ref, child) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black.withOpacity(0.7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {
                                final isAdd = ref
                                    .read(cartProvider.notifier)
                                    .addCartItem(product);
                                if (isAdd == 'success') {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    duration: Duration(seconds: 2),
                                    content:
                                        Text('Successfully item added at cart'),
                                    action: SnackBarAction(
                                      label: 'Go to Cart',
                                      onPressed: () {
                                        Get.to(() => CartScreen(),
                                            transition: Transition.leftToRight);
                                      },
                                    ),
                                  ));
                                }
                              },
                              child: Text(
                                'ADD TO CART',
                                style: TextStyle(fontSize: 17),
                              ));
                        }),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          ImageDetail(product),
        ],
      )),
    );
  }
}
