import 'package:date_format/date_format.dart';
import 'package:ecommerce/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/models/order.dart';

class orderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final orders = ref.watch(orderHistoryProvider);
        return orders.isEmpty
            ? Container()
            : ListView(
                children: orders.map((e) {
                  return ExpansionTile(
                    title: Text(formatDate(
                        DateTime(1999, 2, 10), [yyyy, '-', mm, '-', dd, ' '])),
                    children: e.carts.map((e) {
                      return ListTile(
                        leading: Container(
                          width: 100,
                          height: 100,
                          child: Image.network(e.imageUrl),
                        ),
                        title: Text(e.title),
                        trailing: Container(child: Text(e.total.toString())),
                      );
                    }).toList(),
                  );
                }).toList(),
              );
      }),
    );
  }
}
