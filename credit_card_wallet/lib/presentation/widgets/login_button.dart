import 'package:flutter/material.dart';

import 'package:credit_card_wallet/core/themes/app_themes.dart';

class LoginButton extends StatelessWidget {
  final Function() onPress;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;

  const LoginButton({
    Key? key,
    required this.onPress,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        child: Text(buttonText),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(buttonTextColor),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
