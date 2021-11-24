import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:credit_card_wallet/core/themes/app_themes.dart';

class CustomAuthenticationTextInput extends StatelessWidget {
  final String hintText;
  final Color hintTextColor;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController textEditingController;
  final double radius;
  final TextStyle? textStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Function(String string)? onSubmitted;

  const CustomAuthenticationTextInput({
    Key? key,
    this.hintText = '',
    this.hintTextColor = Colors.grey,
    required this.textInputType,
    this.obscureText = false,
    required this.textEditingController,
    this.radius = 30,
    this.textStyle,
    this.labelText,
    this.labelStyle,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: textEditingController,
      style: textStyle,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        fillColor: AppThemes.kTextInputBackgroundColor,
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
      ),
    );
  }
}
