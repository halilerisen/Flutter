part of 'word_bloc.dart';

@freezed
class WordState with _$WordState {
  const factory WordState.wordLoadInProgress() = WordLoadInProgress;
  const factory WordState.wordFetchSuccess({ModelWordResponse? wordResponse}) = WordFetchSuccess;
  const factory WordState.wordFetchFailure({required String errorMessage}) = WordFetchFailure;
}
