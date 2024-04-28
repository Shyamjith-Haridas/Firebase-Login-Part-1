// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_login/medico_home.dart';
import 'package:firebase_login/resources/authentication.dart';
import 'package:firebase_login/user_account/medico_login.dart';
import 'package:firebase_login/user_account/widgets/account_status.dart';
import 'package:firebase_login/user_account/widgets/sub_title.dart';
import 'package:firebase_login/user_account/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class MedicoSignUpScreen extends StatefulWidget {
  const MedicoSignUpScreen({super.key});

  @override
  State<MedicoSignUpScreen> createState() => _MedicoSignUpScreenState();
}

class _MedicoSignUpScreenState extends State<MedicoSignUpScreen> {
  bool _isVisible = true;

  // controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // auth
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WelcomeTextWidget(
                  text: "Register",
                ),
                const SizedBox(height: 5),
                const SubTitleWidget(
                  subTitle: "Create your new account",
                ),
                const SizedBox(
                  height: 30,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: "Full Name",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: "E-Mail",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // password field
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: _isVisible,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.black),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: !_isVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // button
                GestureDetector(
                  onTap: () async {
                    String output = await authenticationMethods.signUpUser(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    if (output == "success") {
                      log("auth functions");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedicoHomeScreen(),
                        ),
                      );
                    } else {
                      final snackBar = SnackBar(
                        //behavior: SnackBarBehavior.floating,
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                        content: Center(
                          child: Text(
                            output,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(80, 128, 200, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 19,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),

                // or sign in with divider
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "  Or continue with with  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: Colors.white,
                      clipBehavior: Clip.hardEdge,
                      elevation: 2,
                      shadowColor: Colors.black,
                      shape: const CircleBorder(),
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/social_icons/google.png",
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      clipBehavior: Clip.hardEdge,
                      elevation: 2,
                      shadowColor: Colors.black,
                      shape: const CircleBorder(),
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/social_icons/apple.png",
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      clipBehavior: Clip.hardEdge,
                      elevation: 2,
                      shadowColor: Colors.black,
                      shape: const CircleBorder(),
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/social_icons/facebook.png",
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),

                AccountWidget(
                  firstText: "Already have an account?",
                  secondText: "Login",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const MedicoLoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
