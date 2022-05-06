import 'package:flutter/material.dart';

class searchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Item'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
    );
  }
}
