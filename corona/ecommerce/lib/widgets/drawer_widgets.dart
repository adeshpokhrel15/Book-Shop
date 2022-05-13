import 'package:ecommerce/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class drawerWidgets extends StatelessWidget {
  final user = Hive.box<User>('user').values.toList().cast<User>();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final data = ref.watch();

      return Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user[0].fullName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  user[0].email,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Cart'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Get.to(() => drawerWidgets());
            },
            leading: Icon(Icons.payment),
            title: Text('Payment'),
          ),
        ]),
      );
    });
  }
}
