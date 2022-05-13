import 'package:bookshop/models/cartModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartProvider, List<CartModel>>(
    (ref) => CartProvider());
final cartStream =
    StreamProvider.autoDispose((ref) => CartProvider().getCartData());

class CartProvider extends StateNotifier<List<CartModel>> {
  CartProvider() : super([]);
  CollectionReference dbCart = FirebaseFirestore.instance.collection('users');

  Future<dynamic> addToCart(
    String cartId,
    int cartPrice,
    int cartQuantity,
    String totalPrice,
  ) async {
    try {
      final response = await dbCart.add({
        'cartId': cartId,
        'cartPrice': cartPrice,
        'cartQuantity': cartQuantity,
        'totalPrice': totalPrice,
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

  Stream<List<CartModel>> getCartData() {
    final data = dbCart.snapshots().map((event) => _getFromSnap(event));

    return data;
  }

  List<CartModel> _getFromSnap(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      return CartModel(
        cartId: data['cartId'],
        cartPrice: data['cartPrice'],
        cartQuantity: data['cartQuantity'],
        totalPrice: data['totalPrice'],
      );
    }).toList();
  }
}

// import 'package:bookshop/models/cartModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

// class cartProvider with ChangeNotifier {
//   void addReviewCartData({
//     required String cartId,
//     required String cartImage,
//     required int cartPrice,
//     required int cartQuantity,
//   }) async {
//     FirebaseFirestore.instance
//         .collection("ReviewCart")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection("YourReviewCart")
//         .doc(cartId)
//         .set(
//       {
//         "cartId": cartId,
//         "cartImage": cartImage,
//         "cartPrice": cartPrice,
//         "cartQuantity": cartQuantity,
//         "isAdd": true,
//       },
//     );
//   }

//   void updateReviewCartData({
//     required String cartId,
//     required String cartImage,
//     required int cartPrice,
//     required int cartQuantity,
//   }) async {
//     FirebaseFirestore.instance
//         .collection("ReviewCart")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection("YourReviewCart")
//         .doc(cartId)
//         .update(
//       {
//         "cartId": cartId,
//         "cartImage": cartImage,
//         "cartPrice": cartPrice,
//         "cartQuantity": cartQuantity,
//         "isAdd": true,
//       },
//     );
//   }

//   List<CartModel> reviewCartDataList = [];
//   void getReviewCartData() async {
//     List<CartModel> newList = [];

//     QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
//         .collection("ReviewCart")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection("YourReviewCart")
//         .get();
//     reviewCartValue.docs.forEach((element) {
//       CartModel reviewCartModel = CartModel(
//         cartId: element.get("cartId"),
//         cartPrice: element.get("cartPrice"),
//         cartQuantity: element.get("cartQuantity"),
//         totalPrice: element.get("totalPrice"),
//       );
//       newList.add(reviewCartModel);
//     });
//     reviewCartDataList = newList;
//     notifyListeners();
//   }

//   List<CartModel> get getReviewCartDataList {
//     return reviewCartDataList;
//   }

// //// TotalPrice  ///

//   getTotalPrice() {
//     double total = 0.0;
//     reviewCartDataList.forEach((element) {
//       total += element.cartPrice * element.cartQuantity;
//     });
//     return total;
//   }

// ////////////// ReviCartDeleteFunction ////////////
//   reviewCartDataDelete(cartId) {
//     FirebaseFirestore.instance
//         .collection("ReviewCart")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection("YourReviewCart")
//         .doc(cartId)
//         .delete();
//     notifyListeners();
//   }
// }
