import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function() onTap;
  final String title;

  BottomButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(
            title,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
