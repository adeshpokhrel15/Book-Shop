import 'package:bookshop/providers/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class cartScreen extends StatefulWidget {
  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  late int count = 0;

  bool isBool = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final cart = ref.watch(cartProvider.notifier);
      return Column(children: [
        ListView.builder(
            itemCount: cart.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
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
                      'Total:',
                    ),
                    subtitle: Text('\$100'),
                    trailing: Container(
                      width: 100,
                      child: MaterialButton(
                        child: Text("Submit"),
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  body: Column(
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
                                      'https://th.bing.com/th/id/R.2e7380de4d19ec24c828305492c972d1?rik=hPwROiiaELF9Aw&pid=ImgRaw&r=0'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Book 1',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "Rs. 100",
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
                                        onTap: () {},
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
                                                  if (count == 1) {
                                                    Text('200');
                                                  } else {
                                                    setState(() {
                                                      count--;
                                                    });
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                "$count",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (count < 10) {
                                                    setState(() {
                                                      count++;
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
                  ));
            })
      ]);
    });
  }
}
