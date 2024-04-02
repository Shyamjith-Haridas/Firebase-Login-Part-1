import 'package:flutter/material.dart';

class OnboardThree extends StatelessWidget {
  const OnboardThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: Image.asset("assets/onboard/on_board_3.jpg"),
      ),
    );
  }
}
