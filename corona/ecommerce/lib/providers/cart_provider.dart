import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/cart_item.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final cartProvider = StateNotifierProvider<CartProvider, List<CartItem>>(
    (ref) => CartProvider(ref: ref));

class CartProvider extends StateNotifier<List<CartItem>> {
  CartProvider({required this.ref}) : super(ref.read(cartBox)); //read the box

  StateNotifierProviderRef ref;

  String addCartItem(Product product) {
    if (state.isEmpty) {
      final cartItem = CartItem(
          title: product.product_name,
          id: product.id,
          quantity: 1,
          total: 0,
          imageUrl: product.image,
          price: product.price);
      Hive.box<CartItem>('carts').add(cartItem);
      state = [...state, cartItem];
      return 'success';
    } else {
      final cartItem =
          state.firstWhere((element) => element.id == product.id, orElse: () {
        return CartItem(
            total: 0,
            id: '',
            imageUrl: '',
            price: 0,
            quantity: 1,
            title: 'null');
      });
      if (cartItem.title == 'null') {
        final cartItem = CartItem(
            title: product.product_name,
            id: product.id,
            quantity: 1,
            total: 0,
            imageUrl: product.image,
            price: product.price);
        Hive.box<CartItem>('carts').add(cartItem);
        state = [...state, cartItem];
        return 'success';
      } else {
        final totalPrice = cartItem.price * (cartItem.quantity + 1);
        cartItem.quantity = cartItem.quantity + 1;
        cartItem.total = totalPrice;
        cartItem.save();
        return 'success';
      }
    }
  }

  void addSingleItem(CartItem cartItem) {
    cartItem.quantity = cartItem.quantity + 1;
    cartItem.total = cartItem.price * (cartItem.quantity + 1);
    cartItem.save();
    state = [
      for (final element in state)
        if (element == cartItem) cartItem else element
    ];
  }

  void removeSingleItem(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity = cartItem.quantity - 1;
      cartItem.total = cartItem.price * (cartItem.quantity - 1);
      cartItem.save();
      state = [
        for (final element in state)
          if (element == cartItem) cartItem else element
      ];
    }
  }

  int get totalSum {
    int total = 0;
    state.forEach((element) {
      total = total + element.quantity * element.price;
    });

    return total;
  }

  void clearAll() {
    Hive.box<CartItem>('carts').clear();
    state = [];
  }
}
