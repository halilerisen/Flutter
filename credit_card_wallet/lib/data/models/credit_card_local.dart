import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CreditCardLocal extends Equatable {
  String? creditCardId;
  String userEmail;
  String cardName;
  String cardHolderName;
  String cardNumber;
  String validTill;
  String cvv;
  int color;
  bool showBackSide;

  CreditCardLocal({
    this.creditCardId,
    required this.userEmail,
    required this.cardName,
    required this.cardHolderName,
    required this.cardNumber,
    required this.validTill,
    required this.cvv,
    this.color = 4278238420,
    this.showBackSide = false,
  });

  @override
  List<Object> get props {
    return [
      userEmail,
      cardName,
      cardHolderName,
      cardNumber,
      validTill,
      cvv,
      color,
      showBackSide,
    ];
  }

  CreditCardLocal copyWith({
    String? id,
    String? userEmail,
    String? cardName,
    String? cardHolderName,
    String? cardNumber,
    String? validTill,
    String? cvv,
    int? color,
    bool? showBackSide,
  }) {
    return CreditCardLocal(
      creditCardId: id ?? this.creditCardId,
      userEmail: userEmail ?? this.userEmail,
      cardName: cardName ?? this.cardName,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      validTill: validTill ?? this.validTill,
      cvv: cvv ?? this.cvv,
      color: color ?? this.color,
      showBackSide: showBackSide ?? this.showBackSide,
    );
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': creditCardId,
      'userEmail': userEmail,
      'cardName': cardName,
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'validTill': validTill,
      'cvv': cvv,
      'color': color,
      'showBackSide': showBackSide,
    };
  }

  factory CreditCardLocal.fromMap(Map<String, dynamic> map) {
    return CreditCardLocal(
      creditCardId: map['id'] != null ? map['id'] : null,
      userEmail: map['userEmail'],
      cardName: map['cardName'],
      cardHolderName: map['cardHolderName'],
      cardNumber: map['cardNumber'],
      validTill: map['validTill'],
      cvv: map['cvv'],
      color: map['color'],
      showBackSide: map['showBackSide'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCardLocal.fromJson(String source) => CreditCardLocal.fromMap(json.decode(source));

  factory CreditCardLocal.fromSnapshot(DocumentSnapshot snapshot) {
    return CreditCardLocal(
      creditCardId: snapshot.id,
      userEmail: snapshot['userEmail'],
      cardName: snapshot['cardName'],
      cardHolderName: snapshot['cardHolderName'],
      cardNumber: snapshot['cardNumber'],
      validTill: snapshot['validTill'],
      cvv: snapshot['cvv'],
      color: snapshot['color'],
      showBackSide: snapshot['showBackSide'],
    );
  }
}
