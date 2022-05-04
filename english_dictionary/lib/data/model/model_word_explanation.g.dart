// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_word_explanation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModelWordResponse _$$_ModelWordResponseFromJson(Map<String, dynamic> json) =>
    _$_ModelWordResponse(
      listOfExplanation: (json['list'] as List<dynamic>)
          .map((e) => ModelWordExplanation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ModelWordResponseToJson(
        _$_ModelWordResponse instance) =>
    <String, dynamic>{
      'list': instance.listOfExplanation,
    };

_$_ModelWordExplanation _$$_ModelWordExplanationFromJson(
        Map<String, dynamic> json) =>
    _$_ModelWordExplanation(
      definition: json['definition'] as String,
      permalink: json['permalink'] as String,
      thumbsUp: json['thumbs_up'] as int,
      author: json['author'] as String,
      word: json['word'] as String,
      defid: json['defid'] as int,
      currentVote: json['current_vote'] as String,
      writtenOn: DateTime.parse(json['written_on'] as String),
      example: json['example'] as String,
      thumbsDown: json['thumbs_down'] as int,
    );

Map<String, dynamic> _$$_ModelWordExplanationToJson(
        _$_ModelWordExplanation instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'permalink': instance.permalink,
      'thumbs_up': instance.thumbsUp,
      'author': instance.author,
      'word': instance.word,
      'defid': instance.defid,
      'current_vote': instance.currentVote,
      'written_on': instance.writtenOn.toIso8601String(),
      'example': instance.example,
      'thumbs_down': instance.thumbsDown,
    };
