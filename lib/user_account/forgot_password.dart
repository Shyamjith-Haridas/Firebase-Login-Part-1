// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_login/resources/authentication.dart';
import 'package:firebase_login/user_account/medico_login.dart';
import 'package:flutter/material.dart';

class MedicoForgotPassword extends StatefulWidget {
  const MedicoForgotPassword({super.key});

  @override
  State<MedicoForgotPassword> createState() => _MedicoForgotPasswordState();
}

class _MedicoForgotPasswordState extends State<MedicoForgotPassword> {
  final forgotPassController = TextEditingController();

  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  void dispose() {
    forgotPassController.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage("assets/image/forgot_password.jpg"),
            ),
            Text(
              "Forgot Password?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              "No worries. enter your account email address and we will share a reset link.",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
            ),
            const SizedBox(height: 15),
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
                controller: forgotPassController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  hintText: "E-Mail",
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                String output = await authenticationMethods.forgotPassword(
                    email: forgotPassController.text);

                if (output == "success") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const MedicoLoginScreen(),
                    ),
                  );

                  forgotPassController.clear();
                } else {
                  log(output);

                  final snackBar = SnackBar(
                    content: Center(
                        child: Text(
                      output,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
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
                  "Get Link",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
