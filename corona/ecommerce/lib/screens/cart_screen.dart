import 'package:ecommerce/models/cart_item.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      List<CartItem> carts = ref.watch(cartProvider);
      int cartTotal = ref.watch(cartProvider.notifier).totalSum;
      return carts.length == 0
          ? Center(
              child: Container(
                child: Text('add some Product'),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Expanded(
                      flex: 5,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: carts.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 120,
                              child: Row(
                                children: [
                                  Container(
                                      width: 150,
                                      child: Image.network(
                                        carts[index].imageUrl,
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(carts[index].title),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                'Price:- ${carts[index].price}'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 32,
                                              width: 55,
                                              child: OutlinedButton(
                                                  style: OutlinedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          35))),
                                                  onPressed: () {
                                                    ref
                                                        .read(cartProvider
                                                            .notifier)
                                                        .addSingleItem(
                                                            carts[index]);
                                                  },
                                                  child: Icon(Icons.add)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Text(
                                                '${carts[index].quantity}',
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 32,
                                              width: 55,
                                              child: OutlinedButton(
                                                  style: OutlinedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          35))),
                                                  onPressed: () {
                                                    ref
                                                        .read(cartProvider
                                                            .notifier)
                                                        .removeSingleItem(
                                                            carts[index]);
                                                  },
                                                  child: Icon(Icons.remove)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:-',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${cartTotal}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.pink),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black.withOpacity(0.7),
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19),
                                )),
                            onPressed: () {
                              ref.read(cartProvider.notifier).clearAll();
                            },
                            child: Text(
                              'CheckOut',
                              style: TextStyle(fontSize: 17),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            );
    }));
  }
}
