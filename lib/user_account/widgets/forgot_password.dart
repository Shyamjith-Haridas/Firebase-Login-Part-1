import 'package:firebase_login/user_account/forgot_password.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const MedicoForgotPassword(),
            ),
          );
        },
        child: Text(
          "Forgot Password?",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
