import 'package:flutter/material.dart';
import 'package:haloagenda/constans.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color splashColor;
  final Function onPressed;

  CustomPopupMenuButton(
    this.text, {
    @required this.onPressed,
    this.color = Colors.lightBlueAccent,
    this.splashColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4.0,
        right: 4.0,
        bottom: 8.0,
        top: 30.0,
      ),
      child: RaisedButton(
        onPressed: onPressed,
        splashColor: splashColor,
        color: color,
        child: Text(
          text,
          style: kCustomPopupMenuButtonTextStyle,
        ),
      ),
    );
  }
}
