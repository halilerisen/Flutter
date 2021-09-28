import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final int maxLine;
  final TextEditingController messageTextController;
  final TextInputType keyboardType;
  final Function addOnPressedFunction;
  final Function onTapTexfield;
  final bool readOnly;
  final String errorText;
  String suffixText;
  int minLine;
  int maxLength;

  CustomTextField({
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.messageTextController,
    this.maxLine = 1,
    this.minLine = 1,
    this.maxLength,
    this.keyboardType,
    this.addOnPressedFunction,
    this.suffixText,
    this.onTapTexfield,
    this.readOnly,
    this.errorText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        maxLines: maxLine,
        minLines: minLine,
        maxLength: maxLength,
        readOnly: readOnly ?? false,
        controller: messageTextController,
        showCursor: true,
        onTap: onTapTexfield ?? () {},
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black, fontSize: 16.0),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          errorText: errorText,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: suffixIcon,
                  onPressed: addOnPressedFunction ?? () {},
                )
              : null,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
