import 'package:flutter/material.dart';

class OnboardOne extends StatelessWidget {
  const OnboardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: Image.asset("assets/onboard/on_board_1.jpg"),
      ),
    );
  }
}
