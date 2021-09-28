import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constans.dart';

class CustomTexfieldAddButton extends StatelessWidget {
  final Function onPressedFunction;
  final Color splashColor;

  CustomTexfieldAddButton({
    @required this.onPressedFunction,
    @required this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressedFunction,
      padding: EdgeInsets.all(0.0),
      icon: Icon(Ionicons.ios_add),
      color: kAppPrimaryColor,
      iconSize: 36.0,
//longPress Color
      highlightColor: splashColor,
//onTap Color
      splashColor: splashColor,
    );
  }
}
