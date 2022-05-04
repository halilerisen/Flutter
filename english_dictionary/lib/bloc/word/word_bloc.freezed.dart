// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WordEvent {
  String get word => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String word) fetchWordExplanation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? fetchWordExplanation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? fetchWordExplanation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchWordExplanation value) fetchWordExplanation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchWordExplanation value)? fetchWordExplanation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchWordExplanation value)? fetchWordExplanation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordEventCopyWith<WordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordEventCopyWith<$Res> {
  factory $WordEventCopyWith(WordEvent value, $Res Function(WordEvent) then) =
      _$WordEventCopyWithImpl<$Res>;
  $Res call({String word});
}

/// @nodoc
class _$WordEventCopyWithImpl<$Res> implements $WordEventCopyWith<$Res> {
  _$WordEventCopyWithImpl(this._value, this._then);

  final WordEvent _value;
  // ignore: unused_field
  final $Res Function(WordEvent) _then;

  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(_value.copyWith(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FetchWordExplanationCopyWith<$Res>
    implements $WordEventCopyWith<$Res> {
  factory _$FetchWordExplanationCopyWith(_FetchWordExplanation value,
          $Res Function(_FetchWordExplanation) then) =
      __$FetchWordExplanationCopyWithImpl<$Res>;
  @override
  $Res call({String word});
}

/// @nodoc
class __$FetchWordExplanationCopyWithImpl<$Res>
    extends _$WordEventCopyWithImpl<$Res>
    implements _$FetchWordExplanationCopyWith<$Res> {
  __$FetchWordExplanationCopyWithImpl(
      _FetchWordExplanation _value, $Res Function(_FetchWordExplanation) _then)
      : super(_value, (v) => _then(v as _FetchWordExplanation));

  @override
  _FetchWordExplanation get _value => super._value as _FetchWordExplanation;

  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(_FetchWordExplanation(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchWordExplanation implements _FetchWordExplanation {
  const _$_FetchWordExplanation({required this.word});

  @override
  final String word;

  @override
  String toString() {
    return 'WordEvent.fetchWordExplanation(word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchWordExplanation &&
            const DeepCollectionEquality().equals(other.word, word));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(word));

  @JsonKey(ignore: true)
  @override
  _$FetchWordExplanationCopyWith<_FetchWordExplanation> get copyWith =>
      __$FetchWordExplanationCopyWithImpl<_FetchWordExplanation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String word) fetchWordExplanation,
  }) {
    return fetchWordExplanation(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? fetchWordExplanation,
  }) {
    return fetchWordExplanation?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? fetchWordExplanation,
    required TResult orElse(),
  }) {
    if (fetchWordExplanation != null) {
      return fetchWordExplanation(word);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchWordExplanation value) fetchWordExplanation,
  }) {
    return fetchWordExplanation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchWordExplanation value)? fetchWordExplanation,
  }) {
    return fetchWordExplanation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchWordExplanation value)? fetchWordExplanation,
    required TResult orElse(),
  }) {
    if (fetchWordExplanation != null) {
      return fetchWordExplanation(this);
    }
    return orElse();
  }
}

abstract class _FetchWordExplanation implements WordEvent {
  const factory _FetchWordExplanation({required final String word}) =
      _$_FetchWordExplanation;

  @override
  String get word => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FetchWordExplanationCopyWith<_FetchWordExplanation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wordLoadInProgress,
    required TResult Function(ModelWordResponse? wordResponse) wordFetchSuccess,
    required TResult Function(String errorMessage) wordFetchFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wordLoadInProgress,
    TResult Function(ModelWordResponse? wordResponse)? wordFetchSuccess,
    TResult Function(String errorMessage)? wordFetchFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wordLoadInProgress,
    TResult Function(ModelWordResponse? wordResponse)? wordFetchSuccess,
    TResult Function(String errorMessage)? wordFetchFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordLoadInProgress value) wordLoadInProgress,
    required TResult Function(WordFetchSuccess value) wordFetchSuccess,
    required TResult Function(WordFetchFailure value) wordFetchFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WordLoadInProgress value)? wordLoadInProgress,
    TResult Function(WordFetchSuccess value)? wordFetchSuccess,
    TResult Function(WordFetchFailure value)? wordFetchFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordLoadInProgress value)? wordLoadInProgress,
    TResult Function(WordFetchSuccess value)? wordFetchSuccess,
    TResult Function(WordFetchFailure value)? wordFetchFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordStateCopyWith<$Res> {
  factory $WordStateCopyWith(WordState value, $Res Function(WordState) then) =
      _$WordStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WordStateCopyWithImpl<$Res> implements $WordStateCopyWith<$Res> {
  _$WordStateCopyWithImpl(this._value, this._then);

  final WordState _value;
  // ignore: unused_field
  final $Res Function(WordState) _then;
}

/// @nodoc
abstract class $WordLoadInProgressCopyWith<$Res> {
  factory $WordLoadInProgressCopyWith(
          WordLoadInProgress value, $Res Function(WordLoadInProgress) then) =
      _$WordLoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$WordLoadInProgressCopyWithImpl<$Res>
    extends _$WordStateCopyWithImpl<$Res>
    implements $WordLoadInProgressCopyWith<$Res> {
  _$WordLoadInProgressCopyWithImpl(
      WordLoadInProgress _value, $Res Function(WordLoadInProgress) _then)
      : super(_value, (v) => _then(v as WordLoadInProgress));

  @override
  WordLoadInProgress get _value => super._value as WordLoadInProgress;
}

/// @nodoc

class _$WordLoadInProgress implements WordLoadInProgress {
  const _$WordLoadInProgress();

  @override
  String toString() {
    return 'WordState.wordLoadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WordLoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wordLoadInProgress,
    required TResult Function(ModelWordResponse? wordResponse) wordFetchSuccess,
    required TResult Function(String errorMessage) wordFetchFailure,
  }) {
    return wordLoadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wordLoadInProgress,
    TResult Function(ModelWordResponse? wordResponse)? wordFetchSuccess,
    TResult Function(String errorMessage)? wordFetchFailure,
  }) {
    return wordLoadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wordLoadInProgress,
    TResult Function(ModelWordResponse? wordResponse)? wordFetchSuccess,
    TResult Function(String errorMessage)? wordFetchFailure,
    required TResult orElse(),
  }) {
    if (wordLoadInProgress != null) {
      return wordLoadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordLoadInProgress value) wordLoadInProgress,
    required TResult Function(WordFetchSuccess value) wordFetchSuccess,
    required TResult Function(WordFetchFailure value) wordFetchFailure,
  }) {
    return wordLoadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WordLoadInProgress value)? wordLoadInProgress,
    TResult Function(WordFetchSuccess value)? wordFetchSuccess,
    TResult Function(WordFetchFailure value)? wordFetchFailure,
  }) {
    return wordLoadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordLoadInProgress value)? wordLoadInProgress,
    TResult Function(WordFetchSuccess value)? wordFetchSuccess,
    TResult Function(WordFetchFailure value)? wordFetchFailure,
    required TResult orElse(),
  }) {
    if (wordLoadInProgress != null) {
      return wordLoadInProgress(this);
    }
    return orElse();
  }
}

abstract class WordLoadInProgress implements WordState {
  const factory WordLoadInProgress() = _$WordLoadInProgress;
}

/// @nodoc
abstract class $WordFetchSuccessCopyWith<$Res> {
  factory $WordFetchSuccessCopyWith(
          WordFetchSuccess value, $Res Function(WordFetchSuccess) then) =
      _$WordFetchSuccessCopyWithImpl<$Res>;
  $Res call({ModelWordResponse? wordResponse});

  $ModelWordResponseCopyWith<$Res>? get wordResponse;
}

/// @nodoc
class _$WordFetchSuccessCopyWithImpl<$Res> extends _$WordStateCopyWithImpl<$Res>
    implements $WordFetchSuccessCopyWith<$Res> {
  _$WordFetchSuccessCopyWithImpl(
      WordFetchSuccess _value, $Res Function(WordFetchSuccess) _then)
      : super(_value, (v) => _then(v as WordFetchSuccess));

  @override
  WordFetchSuccess get _value => super._value as WordFetchSuccess;

  @override
  $Res call({
    Object? wordResponse = freezed,
  }) {
    return _then(WordFetchSuccess(
      wordResponse: wordResponse == freezed
          ? _value.wordResponse
          : wordResponse // ignore: cast_nullable_to_non_nullable
              as ModelWordResponse?,
    ));
  }

  @override
  $ModelWordResponseCopyWith<$Res>? get wordResponse {
    if (_value.wordResponse == null) {
      return null;
    }

    return $ModelWordResponseCopyWith<$Res>(_value.wordResponse!, (value) {
      return _then(_value.copyWith(wordResponse: value));
    });
  }
}

/// @nodoc

class _$WordFetchSuccess implements WordFetchSuccess {
  const _$WordFetchSuccess({this.wordResponse});

  @override
  final ModelWordResponse? wordResponse;

  @override
  String toString() {
    return 'WordState.wordFetchSuccess(wordResponse: $wordResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WordFetchSuccess &&
            const DeepCollectionEquality()
                .equals(other.wordResponse, wordResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(wordResponse));

  @JsonKey(ignore: true)
  @override
  $WordFetchSuccessCopyWith<WordFetchSuccess> get copyWith =>
      _$WordFetchSuccessCopyWithImpl<WordFetchSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wordLoadInProgress,
    required TResult Function(ModelWordResponse? wordResponse) wordFetchSuccess,
    required TResult Function(String errorMessage) wordFetchFailure,
  }) {
    return wordFetchSuccess(wordResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wordLoadInProgress,
    TResult Function(ModelWordResponse? wordResponse)? wordFetchSuccess,
    TResult Function(String errorMessage)? wordFetchFailure,
  }) {
    return wordFetchSuccess?.call(wordResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wordLoadInProgress,
    TResult Function(ModelWordResponse? wordResponse)? wordFetchSuccess,
    TResult Function(String errorMessage)? wordFetchFailure,
    required TResult orElse(),
  }) {
    if (wordFetchSuccess != null) {
      return wordFetchSuccess(wordResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordLoadInProgress value) wordLoadInProgress,
    required TResult Function(WordFetchSuccess value) wordFetchSuccess,
    required TResult Function(WordFetchFailure value) wordFetchFailure,
  }) {
    return wordFetchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WordLoadInProgress value)? wordLoadInProgress,
    TResult Function(WordFetchSuccess value)? wordFetchSuccess,
    TResult Function(WordFetchFailure value)? wordFetchFailure,
  }) {
    return wordFetchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordLoadInProgress value)? wordLoadInProgress,
    TResult Function(WordFetchSuccess value)? wordFetchSuccess,
    TResult Function(WordFetchFailure value)? wordFetchFailure,
    required TResult orElse(),
  }) {
    if (wordFetchSuccess != null) {
      return wordFetchSuccess(this);
    }
    return orElse();
  }
}

abstract class WordFetchSuccess implements WordState {
  const factory WordFetchSuccess({final ModelWordResponse? wordResponse}) =
      _$WordFetchSuccess;

  ModelWordResponse? get wordResponse => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordFetchSuccessCopyWith<WordFetchSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordFetchFailureCopyWith<$Res> {
  factory $WordFetchFailureCopyWith(
          WordFetchFailure value, $Res Function(WordFetchFailure) then) =
      _$WordFetchFailureCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$WordFetchFailureCopyWithImpl<$Res> extends _$WordStateCopyWithImpl<$Res>
    implements $WordFetchFailureCopyWith<$Res> {
  _$WordFetchFailureCopyWithImpl(
      WordFetchFailure _value, $Res Function(WordFetchFailure) _then)
      : super(_value, (v) => _then(v as WordFetchFailure));

  @override
  WordFetchFailure get _value => super._value as WordFetchFailure;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(WordFetchFailure(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WordFetchFailure implements WordFetchFailure {
  const _$WordFetchFailure({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'WordState.wordFetchFailure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WordFetchFailure &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  $WordFetchFailureCopyWith<WordFetchFailure> get copyWith =>
      _$WordFetchFailureCopyWithImpl<WordFetchFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wordLoadInProgress,
    required TResult Function(ModelWordResponse? wordResponse) wordFetchSuccess,
    required TResult Function(String errorMessage) wordFetchFailure,
  }) {
    return wordFetchFailure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wordLoadInProgress,
    TResult Function(ModelWordResponse? wordResponse)? wordFetchSuccess,
    TResult Function(String errorMessage)? wordFetchFailure,
  }) {
    return wordFetchFailure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wordLoadInProgress,
    TResult Function(ModelWordResponse? wordResponse)? wordFetchSuccess,
    TResult Function(String errorMessage)? wordFetchFailure,
    required TResult orElse(),
  }) {
    if (wordFetchFailure != null) {
      return wordFetchFailure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordLoadInProgress value) wordLoadInProgress,
    required TResult Function(WordFetchSuccess value) wordFetchSuccess,
    required TResult Function(WordFetchFailure value) wordFetchFailure,
  }) {
    return wordFetchFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WordLoadInProgress value)? wordLoadInProgress,
    TResult Function(WordFetchSuccess value)? wordFetchSuccess,
    TResult Function(WordFetchFailure value)? wordFetchFailure,
  }) {
    return wordFetchFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordLoadInProgress value)? wordLoadInProgress,
    TResult Function(WordFetchSuccess value)? wordFetchSuccess,
    TResult Function(WordFetchFailure value)? wordFetchFailure,
    required TResult orElse(),
  }) {
    if (wordFetchFailure != null) {
      return wordFetchFailure(this);
    }
    return orElse();
  }
}

abstract class WordFetchFailure implements WordState {
  const factory WordFetchFailure({required final String errorMessage}) =
      _$WordFetchFailure;

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordFetchFailureCopyWith<WordFetchFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
