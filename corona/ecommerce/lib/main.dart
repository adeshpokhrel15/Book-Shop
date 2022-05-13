import 'package:ecommerce/models/cart_item.dart';
import 'package:ecommerce/models/users.dart';
import 'package:ecommerce/screens/auth_Screen.dart';
import 'package:ecommerce/screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:path_provider/path_provider.dart';

final cartBox = Provider<List<CartItem>>((ref) => []);

void main() async {
  DateTime timeformat;
  initializeDateFormatting(locale, 'en')
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<User>('users');

  final box = await Hive.openBox<CartItem>('cart');

  runApp(ProviderScope(overrides: [
    cartBox.overrideWithValue(box.values.toList()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatusCheck(),
    );
  }
}
