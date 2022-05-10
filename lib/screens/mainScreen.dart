import 'package:bookshop/providers/authProvider.dart';
import 'package:bookshop/providers/productProvider.dart';
import 'package:bookshop/screens/detailsProduct.dart';
import 'package:bookshop/widgets/drawerWidgets.dart';
import 'package:bookshop/widgets/reviewCart.dart';
import 'package:bookshop/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  late int count = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final product = ref.watch(postStream);

        return Scaffold(
            backgroundColor: Colors.grey,
            drawer: drawerWidgets(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Color(0xffd6d382),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => searchWidget()));
                    },
                    icon: Icon(
                      Icons.search,
                      size: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => reviewCart(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xffd6d382),
                      radius: 15,
                      child: Icon(Icons.shop, size: 17, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/book.jpg')),
                    ),
                    child: Row(children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 130, bottom: 10),
                                child: Container(
                                  height: 50,
                                  width: 100,
                                ),
                              ),
                              Text(
                                'There is no friend as loyal as a book',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      )),
                  Column(children: [
                    product.when(
                      data: (data) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => detailProduct()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 250,
                            child: ListView.builder(
                                itemCount: 7,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    height: 240,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Image.network(
                                                data[index].productImage),
                                          ),
                                          Expanded(
                                              child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(data[index].productName,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black)),
                                                  Text('10', //price
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey)),
                                                  Row(children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 30,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.yellow,
                                                          border: Border.all(
                                                            color: Colors.white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                child: Center(
                                                              child: Text(
                                                                '$count book',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      height: 30,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                count--;
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 15,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                          Text(
                                                            '$count',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                count++;
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 15,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                  ])
                                                ],
                                              ),
                                            ),
                                          ))
                                        ]),
                                  );
                                }),
                          ),
                        );
                      },
                      error: (err, stack) => Text('$err'),
                      loading: () => Container(),
                    ),
                  ]),
                ],
              ),
            ));
      },
    );
  }
}
