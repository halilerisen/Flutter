import 'package:flutter/material.dart';

class ButtonStyleOne extends StatelessWidget {
  const ButtonStyleOne({
    Key? key,
    required String buttonText,
    required Function() onPressed,
    Color buttonColor = Colors.cyan,
    Color buttonTextColor = Colors.white,
  })  : _buttonColor = buttonColor,
        _buttonText = buttonText,
        _buttonTextColor = buttonTextColor,
        _onPressed = onPressed,
        super(key: key);

  final String _buttonText;
  final Function() _onPressed;
  final Color _buttonColor;
  final Color _buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        _buttonText,
        style: TextStyle(color: _buttonTextColor),
      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(_buttonColor)),
      onPressed: _onPressed,
    );
  }
}
