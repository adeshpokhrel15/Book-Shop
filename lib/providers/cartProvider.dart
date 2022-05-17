import 'package:bookshop/models/cartModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartProvider, List<CartModel>>(
    (ref) => CartProvider());
final cartStream =
    StreamProvider.autoDispose((ref) => CartProvider().getCartData());

class CartProvider extends StateNotifier<List<CartModel>> {
  CartProvider() : super([]);
  // CollectionReference dbCart = FirebaseFirestore.instance.collection('users');
  CollectionReference dbCart = FirebaseFirestore.instance.collection('cart');

  CollectionReference dbOrder = FirebaseFirestore.instance.collection('orders');

  Future<dynamic> addToCart(
    String cartId,
    int cartPrice,
    int cartQuantity,
    String totalPrice,
    String cartName,
    String cartImage,
  ) async {
    try {
      final response = await dbCart.add({
        'cartId': null,
        'cartPrice': cartPrice,
        'cartQuantity': cartQuantity,
        'totalPrice': totalPrice,
        'cartName': cartName,
        'cartImage': cartImage,
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return '';
    }
  }

  Future<dynamic> addOrder(List<String> productNames, int totalPrice) async {
    try {
      final response = await dbOrder.add({
        'totalPrice': totalPrice,
        'bookNames': productNames,
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return '';
    }
  }

  void addSingleCart(CartModel cartItem) {
    cartItem.cartQuantity = cartItem.cartQuantity + 1;
    cartItem.totalPrice = cartItem.cartPrice * (cartItem.cartQuantity + 1);
    state.add(cartItem);
  }

  Future<String> removePost({required String cartImage}) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('cart/$cartImage');
      await ref.delete();

      return 'success';
    } on FirebaseException catch (err) {
      print(err);
      return '';
    }
  }

  Stream<List<CartModel>> getCartData() {
    final data = dbCart.snapshots().map((event) => _getFromSnap(event));

    return data;
  }

  // Future<CartModel> getCart(String id) async {
  //   final data = await dbCart.doc(id).get();
  //   return _getProduct(data);
  // }

  // CartModel _getProduct(DocumentSnapshot documentSnapshot) {
  //   final data = documentSnapshot.data() as Map<String, dynamic>;
  //   return CartModel(
  //     cartId: documentSnapshot.id,
  //     cartPrice: data['cartPrice'],
  //     cartQuantity: data['cartQuantity'],
  //     // totalPrice: data['totalPrice'],
  //     totalPrice: data['cartPrice'],
  //     productId: data['productId'],
  //     cartName: data["cartName"],
  //   );
  // }

  List<CartModel> _getFromSnap(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      return CartModel(
        // cartId: data['cartId'],
        cartId: e.id,
        cartPrice: data['cartPrice'],
        cartQuantity: data['cartQuantity'],
        //totalPrice: data['totalPrice'],
        totalPrice: data['cartPrice'] * data['cartQuantity'],
        productId: data['productId'] ?? 'temporary',
        cartName: data["cartName"] ?? "",
        cartImage: data["cartImage"] ?? "",
      );
    }).toList();
  }
}
