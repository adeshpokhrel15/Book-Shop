import 'package:badges/badges.dart';
import 'package:bookshop/providers/productProvider.dart';
import 'package:bookshop/screens/detailsProduct.dart';
import 'package:bookshop/widgets/drawerWidgets.dart';
import 'package:bookshop/widgets/cartScreen.dart';
import 'package:bookshop/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class mainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final product = ref.watch(postStream);
        return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.yellow,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => cartScreen());
                      },
                      child: Center(
                        child: Badge(
                          badgeContent: Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          child: Icon(Icons.shopping_bag_outlined),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(children: [
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
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 30),
                    SafeArea(
                      child: Container(
                        height: 520,
                        child: product.when(
                          data: (data) {
                            return Container(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => detailProduct(data[index]));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: 320,
                                          width: double.infinity,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(data[index].productName,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                Text(
                                                    "Rs. " +
                                                        "${data[index].productPrice}", //price
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red)),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.network(
                                                    data[index].productImage,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ])),
                                    );
                                  }),
                            );
                          },
                          error: (err, stack) => Text('$err'),
                          loading: () => Container(),
                        ),
                      ),
                    ),
                  ]),
                )));
      },
    );
  }
}
