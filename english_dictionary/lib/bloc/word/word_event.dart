part of 'word_bloc.dart';

@freezed
class WordEvent with _$WordEvent {
  const factory WordEvent.fetchWordExplanation({required String word}) = _FetchWordExplanation;
}
