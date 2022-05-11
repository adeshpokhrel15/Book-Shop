import 'package:bookshop/providers/productProvider.dart';
import 'package:bookshop/providers/reviewCartProvider.dart';
import 'package:bookshop/widgets/searchItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class reviewCart extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  // final usernameController = TextEditingController();
  // final mailController = TextEditingController();
  // final passController = TextEditingController();

  late int count = 0;
  late int price = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final cart = ref.watch(cartProvider);
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Review Cart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              searchItem(
                isbool: true,
              ),
              SizedBox(
                height: 10,
              ),
              searchItem(
                isbool: true,
              ),
              searchItem(
                isbool: true,
              ),
              searchItem(
                isbool: true,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          bottomNavigationBar: ListTile(
              title: Text("Total Aount"),
              subtitle: Text(
                "Rs. " + "${price * count}",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: Container(
                width: 160,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      _form.currentState!.save();

                      // ref.read(cartProvider).addToCart(
                      //     // email: mailController.text.trim(),
                      //     // password: passController.text.trim()
                      //     );
                    },
                    child: Text('Submit'),
                  ),
                ),
              )));
    });
  }
}
