// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/medico_home.dart';
import 'package:firebase_login/resources/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CloudFireStrore cloudFireStrore = CloudFireStrore();

  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    name.trim();
    email.trim();
    password.trim();

    String output = "something went wrong";

    if (name != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // cloud firestore
        await cloudFireStrore.uploadUserData(
          username: name,
          userEmail: email,
        );

        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "please fill up everything";
    }
    return output;
  }

  // login
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    email.trim();
    password.trim();

    String output = "something went wrong";

    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "please fill up everything";
    }

    return output;
  }

  // forgot password
  Future<String> forgotPassword({required String email}) async {
    email.trim();

    String output = "something went wrong";

    if (email != "") {
      try {
        await firebaseAuth.sendPasswordResetEmail(email: email);

        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "please fill email field";
    }
    return output;
  }

  // google sign in
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        UserCredential signInResult =
            await firebaseAuth.signInWithCredential(credential);

        User? userDetails = signInResult.user;

        if (signInResult != null) {
          firebaseFirestore
              .collection("user_data")
              .doc(firebaseAuth.currentUser!.uid)
              .set(
            {
              "username": userDetails!.displayName,
              "email": userDetails.email,
              "image": userDetails.photoURL,
            },
          );
        } else {
          log("db upload failed..");
        }

        // home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => const MedicoHomeScreen(),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
