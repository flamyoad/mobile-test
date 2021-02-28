// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, public_member_api_docs

part of 'qr_generator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QrGeneratorStateTearOff {
  const _$QrGeneratorStateTearOff();

// ignore: unused_element
  _Data data({@required Seed seed}) {
    return _Data(
      seed: seed,
    );
  }

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _Expired expired() {
    return const _Expired();
  }

// ignore: unused_element
  _Error error([String message]) {
    return _Error(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $QrGeneratorState = _$QrGeneratorStateTearOff();

/// @nodoc
mixin _$QrGeneratorState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult expired(_Expired value),
    @required TResult error(_Error value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult expired(_Expired value),
    TResult error(_Error value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $QrGeneratorStateCopyWith<$Res> {
  factory $QrGeneratorStateCopyWith(
          QrGeneratorState value, $Res Function(QrGeneratorState) then) =
      _$QrGeneratorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$QrGeneratorStateCopyWithImpl<$Res>
    implements $QrGeneratorStateCopyWith<$Res> {
  _$QrGeneratorStateCopyWithImpl(this._value, this._then);

  final QrGeneratorState _value;
  // ignore: unused_field
  final $Res Function(QrGeneratorState) _then;
}

/// @nodoc
abstract class _$DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  $Res call({Seed seed});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object seed = freezed,
  }) {
    return _then(_Data(
      seed: seed == freezed ? _value.seed : seed as Seed,
    ));
  }
}

/// @nodoc
class _$_Data implements _Data {
  const _$_Data({@required this.seed}) : assert(seed != null);

  @override
  final Seed seed;

  @override
  String toString() {
    return 'QrGeneratorState.data(seed: $seed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Data &&
            (identical(other.seed, seed) ||
                const DeepCollectionEquality().equals(other.seed, seed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(seed);

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return data(seed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(seed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult expired(_Expired value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult expired(_Expired value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements QrGeneratorState {
  const factory _Data({@required Seed seed}) = _$_Data;

  Seed get seed;
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'QrGeneratorState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult expired(_Expired value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult expired(_Expired value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements QrGeneratorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'QrGeneratorState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult expired(_Expired value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult expired(_Expired value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements QrGeneratorState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ExpiredCopyWith<$Res> {
  factory _$ExpiredCopyWith(_Expired value, $Res Function(_Expired) then) =
      __$ExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$ExpiredCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
    implements _$ExpiredCopyWith<$Res> {
  __$ExpiredCopyWithImpl(_Expired _value, $Res Function(_Expired) _then)
      : super(_value, (v) => _then(v as _Expired));

  @override
  _Expired get _value => super._value as _Expired;
}

/// @nodoc
class _$_Expired implements _Expired {
  const _$_Expired();

  @override
  String toString() {
    return 'QrGeneratorState.expired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Expired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (expired != null) {
      return expired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult expired(_Expired value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult expired(_Expired value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (expired != null) {
      return expired(this);
    }
    return orElse();
  }
}

abstract class _Expired implements QrGeneratorState {
  const factory _Expired() = _$_Expired;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$QrGeneratorStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_Error(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_Error implements _Error {
  const _$_Error([this.message]);

  @override
  final String message;

  @override
  String toString() {
    return 'QrGeneratorState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(Seed seed),
    @required TResult initial(),
    @required TResult loading(),
    @required TResult expired(),
    @required TResult error(String message),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Seed seed),
    TResult initial(),
    TResult loading(),
    TResult expired(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult expired(_Expired value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(initial != null);
    assert(loading != null);
    assert(expired != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult expired(_Expired value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements QrGeneratorState {
  const factory _Error([String message]) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith;
}
