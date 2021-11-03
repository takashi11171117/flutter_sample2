// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppPageStateTearOff {
  const _$AppPageStateTearOff();

  _AppPageState call({int counter = 0, String privateIp = ''}) {
    return _AppPageState(
      counter: counter,
      privateIp: privateIp,
    );
  }
}

/// @nodoc
const $AppPageState = _$AppPageStateTearOff();

/// @nodoc
mixin _$AppPageState {
  int get counter => throw _privateConstructorUsedError;
  String get privateIp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppPageStateCopyWith<AppPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPageStateCopyWith<$Res> {
  factory $AppPageStateCopyWith(
          AppPageState value, $Res Function(AppPageState) then) =
      _$AppPageStateCopyWithImpl<$Res>;
  $Res call({int counter, String privateIp});
}

/// @nodoc
class _$AppPageStateCopyWithImpl<$Res> implements $AppPageStateCopyWith<$Res> {
  _$AppPageStateCopyWithImpl(this._value, this._then);

  final AppPageState _value;
  // ignore: unused_field
  final $Res Function(AppPageState) _then;

  @override
  $Res call({
    Object? counter = freezed,
    Object? privateIp = freezed,
  }) {
    return _then(_value.copyWith(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      privateIp: privateIp == freezed
          ? _value.privateIp
          : privateIp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AppPageStateCopyWith<$Res>
    implements $AppPageStateCopyWith<$Res> {
  factory _$AppPageStateCopyWith(
          _AppPageState value, $Res Function(_AppPageState) then) =
      __$AppPageStateCopyWithImpl<$Res>;
  @override
  $Res call({int counter, String privateIp});
}

/// @nodoc
class __$AppPageStateCopyWithImpl<$Res> extends _$AppPageStateCopyWithImpl<$Res>
    implements _$AppPageStateCopyWith<$Res> {
  __$AppPageStateCopyWithImpl(
      _AppPageState _value, $Res Function(_AppPageState) _then)
      : super(_value, (v) => _then(v as _AppPageState));

  @override
  _AppPageState get _value => super._value as _AppPageState;

  @override
  $Res call({
    Object? counter = freezed,
    Object? privateIp = freezed,
  }) {
    return _then(_AppPageState(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      privateIp: privateIp == freezed
          ? _value.privateIp
          : privateIp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_AppPageState implements _AppPageState {
  const _$_AppPageState({this.counter = 0, this.privateIp = ''});

  @JsonKey(defaultValue: 0)
  @override
  final int counter;
  @JsonKey(defaultValue: '')
  @override
  final String privateIp;

  @override
  String toString() {
    return 'AppPageState(counter: $counter, privateIp: $privateIp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppPageState &&
            (identical(other.counter, counter) ||
                const DeepCollectionEquality()
                    .equals(other.counter, counter)) &&
            (identical(other.privateIp, privateIp) ||
                const DeepCollectionEquality()
                    .equals(other.privateIp, privateIp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(counter) ^
      const DeepCollectionEquality().hash(privateIp);

  @JsonKey(ignore: true)
  @override
  _$AppPageStateCopyWith<_AppPageState> get copyWith =>
      __$AppPageStateCopyWithImpl<_AppPageState>(this, _$identity);
}

abstract class _AppPageState implements AppPageState {
  const factory _AppPageState({int counter, String privateIp}) =
      _$_AppPageState;

  @override
  int get counter => throw _privateConstructorUsedError;
  @override
  String get privateIp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppPageStateCopyWith<_AppPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
