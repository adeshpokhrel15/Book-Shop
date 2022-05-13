import 'package:hive/hive.dart';
part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late int quantity;

  @HiveField(3)
  late String imageUrl;

  @HiveField(4)
  late int price;

  @HiveField(5)
  late int total;

  CartItem({
    required this.title,
    required this.id,
    required this.quantity,
    required this.total,
    required this.imageUrl,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'price': this.price,
      'title': this.title,
      'quantity': this.quantity,
      'total': this.total,
      'imageUrl': this.imageUrl,
    };
  }
}
