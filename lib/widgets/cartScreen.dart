import 'package:bookshop/models/cartModel.dart';
import 'package:bookshop/providers/cartProvider.dart';
import 'package:bookshop/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class cartScreen extends StatefulWidget {
  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  late int count = 0;

  late List<String> itemsToOrder = [];

  List<dynamic> cartItems = [];

  bool isBool = false;

  int totalPrice = 0;

  _increaseTotal(count) {
    // setState(() {
    totalPrice = totalPrice + int.parse(count.toString());
    // });
  }

  _decreaseTotal(count) {
    setState(() {
      totalPrice = totalPrice - int.parse(count.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final cart = ref.watch(cartProvider.notifier);
      final product = ref.watch(postStream);
      return Scaffold(
          appBar: AppBar(
            title: Text(
              'Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          bottomNavigationBar: ListTile(
            title: Text(
              'Your Total Order is:',
            ),
            subtitle: Text('Rs.' + ' $totalPrice'),
            trailing: Container(
              width: 100,
              child: MaterialButton(
                child: Text('Place Order'),
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                onPressed: () {
                  ref
                      .read(cartProvider.notifier)
                      .addOrder(itemsToOrder, totalPrice);

                  setState(() {
                    cartItems.clear();
                  });
                },
              ),
            ),
          ),
          body: StreamBuilder(
            stream: cart.getCartData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  // child: Text("Error"),
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData) {
                if ((snapshot.data as List).length == 0) {
                  return Center(
                    child: Text("No data"),
                  );
                }
                return ListView.builder(
                  itemCount: (snapshot.data as List).length,
                  itemBuilder: (context, index) {
                    // totalPrice = (int.parse(totalPrice) +
                    //         (snapshot.data as List)[index].price *
                    //             (snapshot.data as List)[index].quantity)
                    //     .toString();

                    // setState(() {
                    // totalPrice +=
                    // totalPrice + (snapshot.data as List)[index].totalPrice;

                    for (int i = 0; i < (snapshot.data as List).length; i++) {
                      // totalPrice += (snapshot.data as List)[i].totalPrice;
                      itemsToOrder =
                          itemsToOrder + [(snapshot.data as List)[i].cartName];

                      cartItems.add((snapshot.data as List)[i]);
                    }

                    _increaseTotal((snapshot.data as List)[index].totalPrice);
                    // });
                    // return CartItem(cartItem: (snapshot.data as List)[index]);
                    // final cartItems = (snapshot.data as List);

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 90,
                                  child: Center(
                                    child: Image.network(
                                      // widget.cartItem.cartImage,
                                      cartItems[index].cartImage,

                                      ///                      'https://th.bing.com/th/id/OIP.oY2WG85YmIRoDoMvUrkCJgHaEO?pid=ImgDet&rs=1',
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 90,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // 'Book 1',
                                            // widget.cartItem.cartId,
                                            // widget.cartItem.cartName,
                                            cartItems[index].cartName,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            '${cartItems[index].cartPrice}',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            await ref
                                                .read(cartProvider.notifier)
                                                .removePost(
                                                    cartId:
                                                        cartItems[index].cartId,
                                                    cartImage: cartItems[index]
                                                        .cartImage);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    // if (CartItem.count == 1) {
                                                    // if (widget.cartItem
                                                    if (cartItems[index]
                                                            .cartQuantity >
                                                        1) {
                                                      setState(() {
                                                        int newCount =
                                                            cartItems[index]
                                                                .cartQuantity--;

                                                        _decreaseTotal(
                                                            cartItems[index]
                                                                .cartPrice);

                                                        // ref
                                                        //     .read(cartProvider
                                                        //         .notifier)
                                                        //     .addToCart(
                                                        //       cartItems[index]
                                                        //           .cartId,
                                                        //       cartItems[index]
                                                        //           .cartPrice,
                                                        //       newCount,
                                                        //       cartItems[index]
                                                        //           .totalPrice,
                                                        //       cartItems[index]
                                                        //           .cartName,

                                                        //       cartItems[index]
                                                        //           .cartImage,
                                                        //     );
                                                      });
                                                    }
                                                  },
                                                  //   } else {
                                                  //     setState(() {
                                                  //       // widget.cartItem
                                                  //       cartItems[index]
                                                  //           .cartQuantity--;
                                                  //     });
                                                  //   }
                                                  // },

                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                ),
                                                Text(
                                                  // "${widget.cartItem.cartQuantity}",
                                                  "${cartItems[index].cartQuantity}",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    // if (widget.cartItem
                                                    if (cartItems[index]
                                                            .cartQuantity <
                                                        10) {
                                                      setState(() {
                                                        // widget.cartItem
                                                        cartItems[index]
                                                            .cartQuantity++;
                                                        _increaseTotal(
                                                            cartItems[index]
                                                                .cartPrice);
                                                      });
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            //  Divider(
                            //     height: 1,
                            //     color: Colors.black45,
                            //   )
                            )
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ));
    });
  }
}




// class CartItem extends StatefulWidget {
//   CartItem({Key? key, required this.cartItem}) : super(key: key);

//   CartModel cartItem;

//   @override
//   State<CartItem> createState() => _CartItemState();
// }

// class _CartItemState extends State<CartItem> {
//   ProductProvider productProvider = ProductProvider();

//   // productProvider;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 90,
//                   child: Center(
//                     child: Image.network(
//                       widget.cartItem.cartImage,

//                       ///                      'https://th.bing.com/th/id/OIP.oY2WG85YmIRoDoMvUrkCJgHaEO?pid=ImgDet&rs=1',
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   height: 90,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             // 'Book 1',
//                             // widget.cartItem.cartId,
//                             widget.cartItem.cartName,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16),
//                           ),
//                           Text(
//                             '${widget.cartItem.cartPrice}',
//                             //   "Rs. 100",
//                             style: TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   height: 90,
//                   padding: EdgeInsets.only(right: 10),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () async {
// // await  ref.removePost(cartImage: widget.cartItem.cartImage);
//                           },
//                           child: Icon(
//                             Icons.delete,
//                             size: 30,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Container(
//                           height: 25,
//                           width: 70,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     // if (CartItem.count == 1) {
//                                     if (widget.cartItem.cartQuantity == 1) {
//                                       Text('200');
//                                     } else {
//                                       setState(() {
//                                         widget.cartItem.cartQuantity--;
//                                       });
//                                     }
//                                   },
//                                   child: Icon(
//                                     Icons.remove,
//                                     color: Colors.black,
//                                     size: 20,
//                                   ),
//                                 ),
//                                 Text(
//                                   "${widget.cartItem.cartQuantity}",
//                                   style: TextStyle(
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     if (widget.cartItem.cartQuantity < 10) {
//                                       setState(() {
//                                         widget.cartItem.cartQuantity++;
//                                       });
//                                     }
//                                   },
//                                   child: Icon(
//                                     Icons.add,
//                                     color: Colors.black,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//             //  Divider(
//             //     height: 1,
//             //     color: Colors.black45,
//             //   )
//             )
//       ],
//     );
//   }
// }