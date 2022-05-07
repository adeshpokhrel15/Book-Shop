import 'package:bookshop/widgets/searchItem.dart';
import 'package:flutter/material.dart';

class reviewCart extends StatelessWidget {
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
              "120",
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
