import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFireStrore {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> uploadUserData({
    required String username,
    required String userEmail,
  }) async {
    firebaseFirestore
        .collection("user_data")
        .doc(firebaseAuth.currentUser!.uid)
        .set(
      {
        "username": username,
        "email": userEmail,
      },
    );
  }
}
