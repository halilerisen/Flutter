part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

class CardsLoading extends CardState {}

class CardsLoaded extends CardState {
  final List<CreditCardLocal> creditCards;

  const CardsLoaded({
    this.creditCards = const <CreditCardLocal>[],
  });

  @override
  List<Object> get props => [creditCards];
}
