// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model_word_explanation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModelWordResponse _$ModelWordResponseFromJson(Map<String, dynamic> json) {
  return _ModelWordResponse.fromJson(json);
}

/// @nodoc
mixin _$ModelWordResponse {
  @JsonKey(name: 'list')
  List<ModelWordExplanation> get listOfExplanation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelWordResponseCopyWith<ModelWordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelWordResponseCopyWith<$Res> {
  factory $ModelWordResponseCopyWith(
          ModelWordResponse value, $Res Function(ModelWordResponse) then) =
      _$ModelWordResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'list') List<ModelWordExplanation> listOfExplanation});
}

/// @nodoc
class _$ModelWordResponseCopyWithImpl<$Res>
    implements $ModelWordResponseCopyWith<$Res> {
  _$ModelWordResponseCopyWithImpl(this._value, this._then);

  final ModelWordResponse _value;
  // ignore: unused_field
  final $Res Function(ModelWordResponse) _then;

  @override
  $Res call({
    Object? listOfExplanation = freezed,
  }) {
    return _then(_value.copyWith(
      listOfExplanation: listOfExplanation == freezed
          ? _value.listOfExplanation
          : listOfExplanation // ignore: cast_nullable_to_non_nullable
              as List<ModelWordExplanation>,
    ));
  }
}

/// @nodoc
abstract class _$ModelWordResponseCopyWith<$Res>
    implements $ModelWordResponseCopyWith<$Res> {
  factory _$ModelWordResponseCopyWith(
          _ModelWordResponse value, $Res Function(_ModelWordResponse) then) =
      __$ModelWordResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'list') List<ModelWordExplanation> listOfExplanation});
}

/// @nodoc
class __$ModelWordResponseCopyWithImpl<$Res>
    extends _$ModelWordResponseCopyWithImpl<$Res>
    implements _$ModelWordResponseCopyWith<$Res> {
  __$ModelWordResponseCopyWithImpl(
      _ModelWordResponse _value, $Res Function(_ModelWordResponse) _then)
      : super(_value, (v) => _then(v as _ModelWordResponse));

  @override
  _ModelWordResponse get _value => super._value as _ModelWordResponse;

  @override
  $Res call({
    Object? listOfExplanation = freezed,
  }) {
    return _then(_ModelWordResponse(
      listOfExplanation: listOfExplanation == freezed
          ? _value.listOfExplanation
          : listOfExplanation // ignore: cast_nullable_to_non_nullable
              as List<ModelWordExplanation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelWordResponse implements _ModelWordResponse {
  _$_ModelWordResponse(
      {@JsonKey(name: 'list')
          required final List<ModelWordExplanation> listOfExplanation})
      : _listOfExplanation = listOfExplanation;

  factory _$_ModelWordResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ModelWordResponseFromJson(json);

  @JsonKey(name: 'list')
  final List<ModelWordExplanation> _listOfExplanation;
  @override
  @JsonKey(name: 'list')
  List<ModelWordExplanation> get listOfExplanation {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfExplanation);
  }

  @override
  String toString() {
    return 'ModelWordResponse(listOfExplanation: $listOfExplanation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModelWordResponse &&
            const DeepCollectionEquality()
                .equals(other.listOfExplanation, listOfExplanation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(listOfExplanation));

  @JsonKey(ignore: true)
  @override
  _$ModelWordResponseCopyWith<_ModelWordResponse> get copyWith =>
      __$ModelWordResponseCopyWithImpl<_ModelWordResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelWordResponseToJson(this);
  }
}

abstract class _ModelWordResponse implements ModelWordResponse {
  factory _ModelWordResponse(
          {@JsonKey(name: 'list')
              required final List<ModelWordExplanation> listOfExplanation}) =
      _$_ModelWordResponse;

  factory _ModelWordResponse.fromJson(Map<String, dynamic> json) =
      _$_ModelWordResponse.fromJson;

  @override
  @JsonKey(name: 'list')
  List<ModelWordExplanation> get listOfExplanation =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModelWordResponseCopyWith<_ModelWordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ModelWordExplanation _$ModelWordExplanationFromJson(Map<String, dynamic> json) {
  return _ModelWordExplanation.fromJson(json);
}

/// @nodoc
mixin _$ModelWordExplanation {
  @JsonKey(name: 'definition')
  String get definition => throw _privateConstructorUsedError;
  @JsonKey(name: 'permalink')
  String get permalink => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbs_up')
  int get thumbsUp => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'defid')
  int get defid => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_vote')
  String get currentVote => throw _privateConstructorUsedError;
  @JsonKey(name: 'written_on')
  DateTime get writtenOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'example')
  String get example => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbs_down')
  int get thumbsDown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelWordExplanationCopyWith<ModelWordExplanation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelWordExplanationCopyWith<$Res> {
  factory $ModelWordExplanationCopyWith(ModelWordExplanation value,
          $Res Function(ModelWordExplanation) then) =
      _$ModelWordExplanationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'definition') String definition,
      @JsonKey(name: 'permalink') String permalink,
      @JsonKey(name: 'thumbs_up') int thumbsUp,
      @JsonKey(name: 'author') String author,
      @JsonKey(name: 'word') String word,
      @JsonKey(name: 'defid') int defid,
      @JsonKey(name: 'current_vote') String currentVote,
      @JsonKey(name: 'written_on') DateTime writtenOn,
      @JsonKey(name: 'example') String example,
      @JsonKey(name: 'thumbs_down') int thumbsDown});
}

/// @nodoc
class _$ModelWordExplanationCopyWithImpl<$Res>
    implements $ModelWordExplanationCopyWith<$Res> {
  _$ModelWordExplanationCopyWithImpl(this._value, this._then);

  final ModelWordExplanation _value;
  // ignore: unused_field
  final $Res Function(ModelWordExplanation) _then;

  @override
  $Res call({
    Object? definition = freezed,
    Object? permalink = freezed,
    Object? thumbsUp = freezed,
    Object? author = freezed,
    Object? word = freezed,
    Object? defid = freezed,
    Object? currentVote = freezed,
    Object? writtenOn = freezed,
    Object? example = freezed,
    Object? thumbsDown = freezed,
  }) {
    return _then(_value.copyWith(
      definition: definition == freezed
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: permalink == freezed
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      thumbsUp: thumbsUp == freezed
          ? _value.thumbsUp
          : thumbsUp // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      defid: defid == freezed
          ? _value.defid
          : defid // ignore: cast_nullable_to_non_nullable
              as int,
      currentVote: currentVote == freezed
          ? _value.currentVote
          : currentVote // ignore: cast_nullable_to_non_nullable
              as String,
      writtenOn: writtenOn == freezed
          ? _value.writtenOn
          : writtenOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      example: example == freezed
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      thumbsDown: thumbsDown == freezed
          ? _value.thumbsDown
          : thumbsDown // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ModelWordExplanationCopyWith<$Res>
    implements $ModelWordExplanationCopyWith<$Res> {
  factory _$ModelWordExplanationCopyWith(_ModelWordExplanation value,
          $Res Function(_ModelWordExplanation) then) =
      __$ModelWordExplanationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'definition') String definition,
      @JsonKey(name: 'permalink') String permalink,
      @JsonKey(name: 'thumbs_up') int thumbsUp,
      @JsonKey(name: 'author') String author,
      @JsonKey(name: 'word') String word,
      @JsonKey(name: 'defid') int defid,
      @JsonKey(name: 'current_vote') String currentVote,
      @JsonKey(name: 'written_on') DateTime writtenOn,
      @JsonKey(name: 'example') String example,
      @JsonKey(name: 'thumbs_down') int thumbsDown});
}

/// @nodoc
class __$ModelWordExplanationCopyWithImpl<$Res>
    extends _$ModelWordExplanationCopyWithImpl<$Res>
    implements _$ModelWordExplanationCopyWith<$Res> {
  __$ModelWordExplanationCopyWithImpl(
      _ModelWordExplanation _value, $Res Function(_ModelWordExplanation) _then)
      : super(_value, (v) => _then(v as _ModelWordExplanation));

  @override
  _ModelWordExplanation get _value => super._value as _ModelWordExplanation;

  @override
  $Res call({
    Object? definition = freezed,
    Object? permalink = freezed,
    Object? thumbsUp = freezed,
    Object? author = freezed,
    Object? word = freezed,
    Object? defid = freezed,
    Object? currentVote = freezed,
    Object? writtenOn = freezed,
    Object? example = freezed,
    Object? thumbsDown = freezed,
  }) {
    return _then(_ModelWordExplanation(
      definition: definition == freezed
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: permalink == freezed
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      thumbsUp: thumbsUp == freezed
          ? _value.thumbsUp
          : thumbsUp // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      defid: defid == freezed
          ? _value.defid
          : defid // ignore: cast_nullable_to_non_nullable
              as int,
      currentVote: currentVote == freezed
          ? _value.currentVote
          : currentVote // ignore: cast_nullable_to_non_nullable
              as String,
      writtenOn: writtenOn == freezed
          ? _value.writtenOn
          : writtenOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      example: example == freezed
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      thumbsDown: thumbsDown == freezed
          ? _value.thumbsDown
          : thumbsDown // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelWordExplanation implements _ModelWordExplanation {
  _$_ModelWordExplanation(
      {@JsonKey(name: 'definition') required this.definition,
      @JsonKey(name: 'permalink') required this.permalink,
      @JsonKey(name: 'thumbs_up') required this.thumbsUp,
      @JsonKey(name: 'author') required this.author,
      @JsonKey(name: 'word') required this.word,
      @JsonKey(name: 'defid') required this.defid,
      @JsonKey(name: 'current_vote') required this.currentVote,
      @JsonKey(name: 'written_on') required this.writtenOn,
      @JsonKey(name: 'example') required this.example,
      @JsonKey(name: 'thumbs_down') required this.thumbsDown});

  factory _$_ModelWordExplanation.fromJson(Map<String, dynamic> json) =>
      _$$_ModelWordExplanationFromJson(json);

  @override
  @JsonKey(name: 'definition')
  final String definition;
  @override
  @JsonKey(name: 'permalink')
  final String permalink;
  @override
  @JsonKey(name: 'thumbs_up')
  final int thumbsUp;
  @override
  @JsonKey(name: 'author')
  final String author;
  @override
  @JsonKey(name: 'word')
  final String word;
  @override
  @JsonKey(name: 'defid')
  final int defid;
  @override
  @JsonKey(name: 'current_vote')
  final String currentVote;
  @override
  @JsonKey(name: 'written_on')
  final DateTime writtenOn;
  @override
  @JsonKey(name: 'example')
  final String example;
  @override
  @JsonKey(name: 'thumbs_down')
  final int thumbsDown;

  @override
  String toString() {
    return 'ModelWordExplanation(definition: $definition, permalink: $permalink, thumbsUp: $thumbsUp, author: $author, word: $word, defid: $defid, currentVote: $currentVote, writtenOn: $writtenOn, example: $example, thumbsDown: $thumbsDown)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModelWordExplanation &&
            const DeepCollectionEquality()
                .equals(other.definition, definition) &&
            const DeepCollectionEquality().equals(other.permalink, permalink) &&
            const DeepCollectionEquality().equals(other.thumbsUp, thumbsUp) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality().equals(other.defid, defid) &&
            const DeepCollectionEquality()
                .equals(other.currentVote, currentVote) &&
            const DeepCollectionEquality().equals(other.writtenOn, writtenOn) &&
            const DeepCollectionEquality().equals(other.example, example) &&
            const DeepCollectionEquality()
                .equals(other.thumbsDown, thumbsDown));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(definition),
      const DeepCollectionEquality().hash(permalink),
      const DeepCollectionEquality().hash(thumbsUp),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(defid),
      const DeepCollectionEquality().hash(currentVote),
      const DeepCollectionEquality().hash(writtenOn),
      const DeepCollectionEquality().hash(example),
      const DeepCollectionEquality().hash(thumbsDown));

  @JsonKey(ignore: true)
  @override
  _$ModelWordExplanationCopyWith<_ModelWordExplanation> get copyWith =>
      __$ModelWordExplanationCopyWithImpl<_ModelWordExplanation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelWordExplanationToJson(this);
  }
}

abstract class _ModelWordExplanation implements ModelWordExplanation {
  factory _ModelWordExplanation(
          {@JsonKey(name: 'definition') required final String definition,
          @JsonKey(name: 'permalink') required final String permalink,
          @JsonKey(name: 'thumbs_up') required final int thumbsUp,
          @JsonKey(name: 'author') required final String author,
          @JsonKey(name: 'word') required final String word,
          @JsonKey(name: 'defid') required final int defid,
          @JsonKey(name: 'current_vote') required final String currentVote,
          @JsonKey(name: 'written_on') required final DateTime writtenOn,
          @JsonKey(name: 'example') required final String example,
          @JsonKey(name: 'thumbs_down') required final int thumbsDown}) =
      _$_ModelWordExplanation;

  factory _ModelWordExplanation.fromJson(Map<String, dynamic> json) =
      _$_ModelWordExplanation.fromJson;

  @override
  @JsonKey(name: 'definition')
  String get definition => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'permalink')
  String get permalink => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'thumbs_up')
  int get thumbsUp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'author')
  String get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'word')
  String get word => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'defid')
  int get defid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'current_vote')
  String get currentVote => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'written_on')
  DateTime get writtenOn => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'example')
  String get example => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'thumbs_down')
  int get thumbsDown => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModelWordExplanationCopyWith<_ModelWordExplanation> get copyWith =>
      throw _privateConstructorUsedError;
}
