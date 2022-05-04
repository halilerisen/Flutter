import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_word_explanation.freezed.dart';
part 'model_word_explanation.g.dart';

@freezed
class ModelWordResponse with _$ModelWordResponse {
  factory ModelWordResponse({
    @JsonKey(name: 'list') required List<ModelWordExplanation> listOfExplanation,
  }) = _ModelWordResponse;

  factory ModelWordResponse.fromJson(Map<String, dynamic> json) => _$ModelWordResponseFromJson(json);
}

@freezed
class ModelWordExplanation with _$ModelWordExplanation {
  factory ModelWordExplanation({
    @JsonKey(name: 'definition') required String definition,
    @JsonKey(name: 'permalink') required String permalink,
    @JsonKey(name: 'thumbs_up') required int thumbsUp,
    @JsonKey(name: 'author') required String author,
    @JsonKey(name: 'word') required String word,
    @JsonKey(name: 'defid') required int defid,
    @JsonKey(name: 'current_vote') required String currentVote,
    @JsonKey(name: 'written_on') required DateTime writtenOn,
    @JsonKey(name: 'example') required String example,
    @JsonKey(name: 'thumbs_down') required int thumbsDown,
  }) = _ModelWordExplanation;

  factory ModelWordExplanation.fromJson(Map<String, dynamic> json) => _$ModelWordExplanationFromJson(json);
}
