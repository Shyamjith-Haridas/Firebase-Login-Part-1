import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
  });

  final String firstText;
  final String secondText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            secondText,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color.fromRGBO(80, 128, 200, 1),
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ],
    );
  }
}
