import 'package:ecommerce/models/users.dart';
import 'package:ecommerce/screens/auth_Screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StatusCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<User>>(
        valueListenable: Hive.box<User>('users').listenable(),
        builder: (context, box, child) {
          final user = box.values.toList().cast<User>();
          return user.length == 0 ? AuthScreen() : HomeScreen();
        });
  }
}
