import 'package:bookshop/models/cartModel.dart';

class Order {
  late int amount;
  // late List<CartModel> products;
  late List<String> products;

  Order({required this.amount, required this.products});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      amount: json['amount'],
      products: json['products'],
    );
  }

  // factory Order.fromJson(Map<String, dynamic> json) => Order(
  //       amount: json["amount"],
  //       products: (json['products'] as List)
  //           .map((e) => CartModel.fromJson(e))
  //           .toList(),
  //     );

}
