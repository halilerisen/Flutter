import 'package:flutter/material.dart';

class ButtonStyleAuthentication extends StatelessWidget {
  final Function() onPressed;

  const ButtonStyleAuthentication({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(color: Colors.redAccent.shade100, borderRadius: BorderRadius.circular(50)),
      child: IconButton(
        icon: const Icon(Icons.arrow_forward, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
