import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:credit_card_wallet/data/models/credit_card_local.dart';
import 'package:credit_card_wallet/data/repositories/card_repository.dart';
import 'package:equatable/equatable.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository _cardRepository;
  StreamSubscription? _creditCardsSubscription;
  StreamSubscription? _authSubscription;

  CardBloc({
    required CardRepository cardRepository,
    StreamSubscription? creditCardsSubscription,
  })  : _cardRepository = cardRepository,
        _creditCardsSubscription = creditCardsSubscription,
        super(CardsLoading()) {
    on<LoadCreditCards>(_mapLoadCreditCardsToState);
    on<UpdateCreditCards>(_mapUpdateCreditCardsToState);
    on<AddNewCreditCard>(_mapAddNewCreditCardToState);
    on<RemoveCreditCard>(_mapRemoveCreditCardToState);

    
  }

  void _mapLoadCreditCardsToState(LoadCreditCards event, Emitter<CardState> emit) {
    _creditCardsSubscription?.cancel();
    _creditCardsSubscription = _cardRepository.getAllCreditCards().listen((creditCards) {
      add(UpdateCreditCards(creditCards: creditCards));
    });
  }

  void _mapUpdateCreditCardsToState(UpdateCreditCards event, Emitter<CardState> emit) {
    emit(CardsLoaded(creditCards: event.creditCards));
  }

  void _mapAddNewCreditCardToState(AddNewCreditCard event, Emitter<CardState> emit) {
    _cardRepository.addNewCard(event.creditCard);
  }

  void _mapRemoveCreditCardToState(RemoveCreditCard event, Emitter<CardState> emit) {
    _cardRepository.removeCard(event.creditCard);
  }

  @override
  Future<void> close() {
    _creditCardsSubscription?.cancel();
    return super.close();
  }
}
