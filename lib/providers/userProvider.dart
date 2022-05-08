import 'package:bookshop/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StreamProvider((ref) => UserProvider().getUser());
final userStream =
    StreamProvider.autoDispose((ref) => UserProvider().getSingleUser());

class UserProvider {
  CollectionReference dbUser = FirebaseFirestore.instance.collection('users');
  Stream<User> getSingleUser() {
    final uid = auth.FirebaseAuth.instance.currentUser!.uid;
    final user = dbUser.where('userId', isEqualTo: uid).snapshots();
    return user.map((event) => singleUser(event));
  }

  User singleUser(QuerySnapshot querySnapshot) {
    final singeData = querySnapshot.docs[0].data() as Map<String, dynamic>;
    return User.fromJson(singeData);
  }

  Stream<List<User>> getUser() {
    final data = dbUser.snapshots().map((event) => _getFromSnap(event));
    return data;
  }

  List<User> _getFromSnap(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((e) => User.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}

final singleUserProvider = FutureProvider.family(
    (ref, String uid) => SingleUserProvider().getLoginUser(uid));

class SingleUserProvider {
  Future<User> getLoginUser(String uid) async {
    CollectionReference dbUser = FirebaseFirestore.instance.collection('users');
    final response = await dbUser.where('userId', isEqualTo: uid).get();
    print(response);
    return User.fromJson(response.docs[0].data() as Map<String, dynamic>);
  }
}
