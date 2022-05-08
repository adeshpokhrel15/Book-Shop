import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    StreamProvider((ref) => FirebaseAuth.instance.authStateChanges());

final logSignProvider = Provider((ref) => LoginSignUpProvider());

class LoginSignUpProvider {
  CollectionReference dBusers = FirebaseFirestore.instance.collection('users');

  Future<String> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      dBusers.add({
        'userName': userName,
        'email': email,
        'userId': response.user!.uid,
      });

      return 'success';
    } on FirebaseException catch (e) {
      return '';
    }
  }

  Future<String> Login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return 'success';
    } on FirebaseException catch (e) {
      return '';
    }
  }

  Future<String> LogOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'Success';
    } on FirebaseException catch (e) {
      return '';
    }
  }
}
