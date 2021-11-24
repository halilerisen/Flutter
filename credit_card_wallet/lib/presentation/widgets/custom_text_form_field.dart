import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    Key? key,
    required this.textInputType,
    required this.textEditingController,
    required this.validator,
    required this.onSaved,
    this.inputFormatters,
    this.maxLength,
    this.obscureText = false,
    this.radius = 0,
    this.hintText,
    this.textStyle,
    this.labelText,
    this.labelStyle,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
  }) : super(key: key);

  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final String? Function(String? value) validator;
  final Function() onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool obscureText;
  final double radius;
  final String? hintText;
  final TextStyle? textStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final Function(String string)? onSubmitted;
  final Function(String string)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: textEditingController,
      validator: validator,
      style: textStyle,
      obscureText: obscureText,
      maxLength: maxLength,
      onEditingComplete: onSaved,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
