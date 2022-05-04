import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/model_word_explanation.dart';
import '../../data/service/service_dio_client.dart';

part 'word_bloc.freezed.dart';
part 'word_event.dart';
part 'word_state.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  WordBloc({required ServiceDioClient client})
      : _client = client,
        super(const WordState.wordFetchSuccess()) {
    on(
      (WordEvent event, Emitter<WordState> emit) => event.map(
        fetchWordExplanation: (_FetchWordExplanation event2) async {
          emit(const WordState.wordLoadInProgress());

          final dynamic res = await _client.getWordExplanation(word: event2.word);

          if (res is ModelWordResponse) {
            emit(WordState.wordFetchSuccess(wordResponse: res));
          } else {
            emit(WordState.wordFetchFailure(errorMessage: res as String));
          }

          return null;
        },
      ),
    );
  }

  final ServiceDioClient _client;
}
