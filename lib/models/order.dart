import 'package:bookshop/models/cartModel.dart';

class Order {
  late int amount;
  late List<String> products;

  Order({required this.amount, required this.products});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      amount: json['amount'],
      products: json['products'],
    );
  }
}
