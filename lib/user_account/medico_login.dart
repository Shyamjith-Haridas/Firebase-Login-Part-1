import 'package:firebase_login/medico_home.dart';
import 'package:firebase_login/user_account/medico_signup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widgets/account_status.dart';
import 'widgets/forgot_password.dart';
import 'widgets/sub_title.dart';
import 'widgets/welcome_text.dart';

class MedicoLoginScreen extends StatefulWidget {
  const MedicoLoginScreen({super.key});

  @override
  State<MedicoLoginScreen> createState() => _MedicoLoginScreenState();
}

class _MedicoLoginScreenState extends State<MedicoLoginScreen> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // lottie
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Lottie.asset("assets/animations/login-animation.json"),
                ),

                //welcome text
                const WelcomeTextWidget(
                  text: "Welcome Back",
                ),

                // welcome text 2
                const SubTitleWidget(
                  subTitle: "Login to your account",
                ),
                const SizedBox(
                  height: 30,
                ),

                // input fields
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
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
                    obscureText: _isVisible,
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
                const SizedBox(height: 15),

                // forgot password
                const ForgotPassword(),
                const SizedBox(height: 70),

                // login button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicoHomeScreen(),
                      ),
                    );
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
                      "Login",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 19,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // dont' have an account section
                AccountWidget(
                  firstText: "Don't have an account?",
                  secondText: "Sign up",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const MedicoSignUpScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
