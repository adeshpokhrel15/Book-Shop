import 'package:bookshop/screens/mainScreen.dart';
import 'package:bookshop/screens/statusCheck.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: mainScreen(),
      //     home: mainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
