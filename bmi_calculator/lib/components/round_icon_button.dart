import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  RoundIconButton({required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(), //Buton şeklini belirleme
      fillColor: Color(0xFF4C4F5E), //Buton rengi ayarlarma
      elevation: 0, //Button etrafında gölgelendirme
      //Butoon Boyutlarını ayarlama
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
