import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // signup
  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    name.trim();
    email.trim();

    String output = "Something went wrong";

    if (name != "" && email != "" && password != "") {
      try {
        firebaseAuth.createUserWithEmailAndPassword(
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
}
