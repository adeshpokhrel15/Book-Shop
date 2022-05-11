import 'package:bookshop/models/cartModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//final cartProvider = StateNotifierProvider<ReviewCartProvider, List<CartModel>>((ref) => ReviewCartProvider(ref: ref));

final cartProvider =
    StreamProvider((ref) => FirebaseAuth.instance.authStateChanges());
final cartStream =
    StreamProvider.autoDispose((ref) => ReviewCartProvider().getCartData());

class ReviewCartProvider {
  CollectionReference dbCart = FirebaseFirestore.instance.collection('users');

  Future<dynamic> addToCart({
    required String cartId,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    try {
      final response =
          await FirebaseFirestore.instance.collection('users').add({
        'cartId': cartId,
        'cartImage': cartImage,
        'cartPrice': cartPrice,
        'cartQuantity': cartQuantity,
      });
      return 'success';
    } on FirebaseException catch (e) {
      return '';
    }
  }

  Stream<List<CartModel>> getCartData() {
    final data = dbCart.snapshots().map((event) => _getFromSnap(event));

    return data;
  }

  List<CartModel> _getFromSnap(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      return CartModel(
        cartId: data['cartId'],
        cartImage: data['cartImage'],
        cartPrice: data['cartPrice'],
        cartQuantity: data['cartQuantity'],
      );
    }).toList();
  }
}
