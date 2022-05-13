import 'package:ecommerce/models/users.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/detail_screen.dart';
import 'package:ecommerce/widgets/drawer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Shop'),
          actions: [
            TextButton(
                onPressed: () {
                  Hive.box<User>('users').clear();
                },
                child: Text(
                  'SignOut',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
            TextButton(
                onPressed: () {
                  Get.to(() => CartScreen(),
                      transition: Transition.leftToRight);
                },
                child: Text(
                  'Cart',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
        drawer: drawerWidgets(), // for the drawer
        body: Consumer(builder: (context, ref, child) {
          final products = ref.watch(productProvider);
          return products.when(
              data: (data) {
                return GridView.builder(
                    itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 250),
                    // MediaQuery.of(context).size.width * 0.55),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailScreen(data[index]),
                              transition: Transition.leftToRight);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 170,
                                  width: double.infinity,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Hero(
                                          tag: '${data[index].id}',
                                          child: Image.network(
                                            data[index].image,
                                            fit: BoxFit.cover,
                                          )))),
                              Text(
                                data[index].product_name,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rs.${data[index].price}',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              error: (err, stack) => Text('$err'),
              loading: () => Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  ));
        }));
  }
}
