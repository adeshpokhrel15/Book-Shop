import 'package:flutter/material.dart';

class searchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: ListView(children: [
        ListTile(
          title: Text("Items"),
        ),
        Container(
          height: 52,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.blueGrey,
              filled: true,
              hintText: "Search Book",
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
