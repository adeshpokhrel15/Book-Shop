import 'package:ecommerce/models/cart_item.dart';

class Order {
  late String? Id;
  late int amout;
  late String dateTime;
  late List<CartItem> carts;

  Order(
      {this.Id,
      required this.amout,
      required this.dateTime,
      required this.carts});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      dateTime: json['dateTime'],
      amout: json['amout'],
      carts: (json['carts'] as List).map((e) => CartItem.fromJson(e)).toList(),
    );
  }
}
