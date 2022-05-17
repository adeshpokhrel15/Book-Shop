import 'package:bookshop/models/productModel.dart';
import 'package:bookshop/providers/cartProvider.dart';
import 'package:bookshop/widgets/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class detailProduct extends StatelessWidget {
  final ProductModel product;
  detailProduct(this.product);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer(builder: (context, ref, child) {
      final cartP = ref.watch(cartStream);
      return Scaffold(
          backgroundColor: Colors.orange,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: height * 0.3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 160, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          product.productDetails,
                          style: TextStyle(fontSize: 17),
                        )),
                        Consumer(builder: (context, ref, child) {
                          return Container(
                            width: double.infinity,
                            height: 50,
                            child: Consumer(builder: (context, ref, child) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    // ref.read(cartProvider.notifier).addToCart(''));

                                    // Add the item to cart
                                    ref.read(cartProvider.notifier).addToCart(
                                          "temp",
                                          product.productPrice,
                                          1,
                                          (product.productPrice).toString(),
                                          product.productName,
                                          product.productImage,
                                        );

                                    Get.to(() => cartScreen());
                                  },
                                  // final response = ref
                                  //     .read(cartProvider.notifier)
                                  //     .addProduct(product);
                                  // if (response == 'success') {
                                  //   ScaffoldMessenger.of(context)
                                  //       .hideCurrentSnackBar();
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(SnackBar(
                                  //     duration: Duration(milliseconds: 1500),
                                  //     content: Text('successfully added to cart'),
                                  //     action: SnackBarAction(
                                  //         label: 'Go to cart',
                                  //         onPressed: () {
                                  //           Get.to(() => CartScreen(),
                                  //               transition:
                                  //                   Transition.leftToRight);
                                  //         }),
                                  //   ));
                                  // } else {
                                  //   ScaffoldMessenger.of(context)
                                  //       .hideCurrentSnackBar();
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(SnackBar(
                                  //     duration: Duration(milliseconds: 1500),
                                  //     content: Text('already added to cart'),
                                  //     action: SnackBarAction(
                                  //         label: 'Go to cart',
                                  //         onPressed: () {
                                  //           Get.to(() => CartScreen(),
                                  //               transition:
                                  //                   Transition.leftToRight);
                                  //         }),
                                  //   ));
                                  // }
                                  // },
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(fontSize: 17),
                                  ));
                            }),
                          );
                        })
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25, left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Rs. ${product.productPrice}',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                              height: 240,
                              width: 240,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    product.productImage,
                                    fit: BoxFit.cover,
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
