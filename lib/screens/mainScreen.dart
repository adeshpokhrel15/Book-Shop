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
  Widget singleBook(
      {required String image, required String name, required double price}) {
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 10,
        ),
        Expanded(flex: 1, child: Image.asset('assets/$image')),
        Expanded(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$name',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text('Rs. $price',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
                Row(children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            '1 book',
                            style: TextStyle(fontSize: 10),
                          )),
                          Center(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: Colors.red,
                            ),
                          )
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
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove,
                          size: 15,
                          color: Colors.red,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.red,
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
  }

  Widget NepaliBook(
      {required String image, required String name, required double price}) {
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(flex: 1, child: Image.asset('assets/$image')),
        Expanded(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$name',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text('$price',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
                Row(children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            '1 book',
                            style: TextStyle(fontSize: 10),
                          )),
                          Center(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: Colors.red,
                            ),
                          )
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
                      color: Colors.blue,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove,
                          size: 15,
                          color: Colors.red,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.remove,
                          size: 15,
                          color: Colors.red,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: drawerWidgets(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd6d382),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => searchWidget()));
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
                    fit: BoxFit.cover, image: AssetImage('assets/book.jpg')),
              ),
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 130, bottom: 10),
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
            Consumer(builder: (context, ref, child) {
              final product = ref.watch(imageStream);

              product.when(
                  data: (data) {},
                  error: (err, stack) => Text('$err'),
                  loading: () => CircularProgressIndicator());
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => detailProduct(
                          productImage: 'book1.jpg',
                          productName: 'One Indian Girl',
                          productPrice: 10,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      singleBook(
                          image: 'book1.jpg',
                          name: 'One Indian Girl',
                          price: 10.00),
                      singleBook(
                          image: 'book2.jpg', name: 'No Way Out', price: 20.00),
                      singleBook(
                          image: 'book3.jpg',
                          name: 'Eyes Wide Open',
                          price: 30.00),
                      singleBook(
                          image: 'book4.jpg',
                          name: 'Isaacs Storm',
                          price: 40.00),
                    ],
                  ),
                ),
              );
            }),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular',
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleBook(
                      image: 'book9.jpg', name: 'Palpasa Cafe', price: 50.00),
                  singleBook(
                      image: 'book10.jpg', name: 'Cuckoo Hill', price: 60.00),
                  singleBook(
                      image: 'book11.jpg',
                      name: 'Sound Pleasure',
                      price: 70.00),
                  singleBook(
                      image: 'book8.jpg', name: 'Galileo Finger', price: 80.00),
                  singleBook(
                      image: 'book12.jpg', name: 'The Forest', price: 90.00),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nepali Popular',
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleBook(
                      image: 'book9.jpg', name: 'Palpasa Cafe', price: 50.00),
                  singleBook(
                      image: 'book10.jpg', name: 'Cuckoo Hill', price: 60.00),
                  singleBook(
                      image: 'book11.jpg',
                      name: 'Sound Pleasure',
                      price: 70.00),
                  singleBook(
                      image: 'book8.jpg', name: 'Galileo Finger', price: 80.00),
                  singleBook(
                      image: 'book12.jpg', name: 'The Forest', price: 90.00),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
