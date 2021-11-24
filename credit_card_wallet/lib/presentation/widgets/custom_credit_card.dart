import 'package:awesome_card/awesome_card.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({
    Key? key,
    required this.onTap,
    required this.cardNumber,
    required this.validTill,
    required this.cardHolderName,
    required this.cvvCode,
    required this.cardName,
    required this.showBackSide,
    this.frontBackground,
    this.backgroundColor,
    this.width,
    this.height,
  }) : super(key: key);

  final Function() onTap;
  final String cardNumber;
  final String validTill;
  final String cardHolderName;
  final String cvvCode;
  final String cardName;
  final bool showBackSide;
  final Container? frontBackground;
  final Container? backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CreditCard(
        cardNumber: cardNumber,
        cardExpiry: validTill,
        cardHolderName: cardHolderName,
        cvv: cvvCode,
        bankName: cardName,
        showBackSide: showBackSide,
        frontBackground: frontBackground ?? CardBackgrounds.black,
        backBackground: backgroundColor ?? CardBackgrounds.white,
        height: height,
        width: width,
        showShadow: true,
        textName: 'Name',
        textExpDate: 'Exp. Date',
        textExpiry: 'MM/YY',
      ),
    );
  }
}
