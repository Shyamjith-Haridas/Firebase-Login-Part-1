import 'dart:async';

import 'package:firebase_login/on_boarding/on_board_main.dart';
import 'package:flutter/material.dart';

class MedicoSplashScreen extends StatefulWidget {
  const MedicoSplashScreen({super.key});

  @override
  State<MedicoSplashScreen> createState() => _MedicoSplashScreenState();
}

class _MedicoSplashScreenState extends State<MedicoSplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => const MedicoOnboardHome(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/splash/medico.png"),
      ),
    );
  }
}
