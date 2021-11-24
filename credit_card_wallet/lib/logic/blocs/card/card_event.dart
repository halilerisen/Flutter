part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class LoadCreditCards extends CardEvent {}

class UpdateCreditCards extends CardEvent {
  final List<CreditCardLocal> creditCards;

  const UpdateCreditCards({
    required this.creditCards,
  });

  @override
  List<Object> get props => [creditCards];
}

class AddNewCreditCard extends CardEvent {
  final CreditCardLocal creditCard;

  const AddNewCreditCard({
    required this.creditCard,
  });

  @override
  List<Object> get props => [creditCard];
}

class RemoveCreditCard extends CardEvent {
  final CreditCardLocal creditCard;

  const RemoveCreditCard({
    required this.creditCard,
  });

  @override
  List<Object> get props => [creditCard];
}
