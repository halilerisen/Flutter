import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:credit_card_wallet/data/models/credit_card_local.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CardRepository extends Equatable {
  FirebaseFirestore _fireStore;

  CardRepository(
    FirebaseFirestore firebaseFirestore,
  ) : _fireStore = firebaseFirestore;

  Future<void> addNewCard(CreditCardLocal creditCard) {
    return _fireStore.collection('creditCards').add(creditCard.toMap());
  }

  Future<void> removeCard(CreditCardLocal creditCard) {
    return _fireStore.collection('creditCards').doc(creditCard.creditCardId).delete();
  }

  Stream<List<CreditCardLocal>> getAllCreditCards() {
    print(FirebaseAuth.instance.currentUser!.email);
    return _fireStore.collection('creditCards').where('userEmail', isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (snapshot) => CreditCardLocal.fromSnapshot(snapshot),
              )
              .toList(),
        );
  }

  @override
  List<Object> get props => [_fireStore];

  @override
  bool get stringify => true;
}
