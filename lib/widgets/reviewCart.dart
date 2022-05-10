import 'package:bookshop/providers/productProvider.dart';
import 'package:bookshop/widgets/searchItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class reviewCart extends StatelessWidget {
  late int count = 0;
  late int price = 0;
  @override
  Widget build(BuildContext context) {
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
                child: MaterialButton(
                  child: Text("Submit"),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                  onPressed: () {},
                ))));
  }
}
