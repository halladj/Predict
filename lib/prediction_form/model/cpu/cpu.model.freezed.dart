// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cpu.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CPU _$CPUFromJson(Map<String, dynamic> json) {
  return _CPU.fromJson(json);
}

/// @nodoc
class _$CPUTearOff {
  const _$CPUTearOff();

  _CPU call(
      {String name = "",
      String brand = "",
      String family = "",
      double frequency = 0.0,
      String modifier = "",
      int numberIdentifier = 0,
      int generation = 0}) {
    return _CPU(
      name: name,
      brand: brand,
      family: family,
      frequency: frequency,
      modifier: modifier,
      numberIdentifier: numberIdentifier,
      generation: generation,
    );
  }

  CPU fromJson(Map<String, Object?> json) {
    return CPU.fromJson(json);
  }
}

/// @nodoc
const $CPU = _$CPUTearOff();

/// @nodoc
mixin _$CPU {
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get family => throw _privateConstructorUsedError;
  double get frequency => throw _privateConstructorUsedError;
  String get modifier => throw _privateConstructorUsedError;
  int get numberIdentifier => throw _privateConstructorUsedError;
  int get generation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CPUCopyWith<CPU> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CPUCopyWith<$Res> {
  factory $CPUCopyWith(CPU value, $Res Function(CPU) then) =
      _$CPUCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String brand,
      String family,
      double frequency,
      String modifier,
      int numberIdentifier,
      int generation});
}

/// @nodoc
class _$CPUCopyWithImpl<$Res> implements $CPUCopyWith<$Res> {
  _$CPUCopyWithImpl(this._value, this._then);

  final CPU _value;
  // ignore: unused_field
  final $Res Function(CPU) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? brand = freezed,
    Object? family = freezed,
    Object? frequency = freezed,
    Object? modifier = freezed,
    Object? numberIdentifier = freezed,
    Object? generation = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      family: family == freezed
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double,
      modifier: modifier == freezed
          ? _value.modifier
          : modifier // ignore: cast_nullable_to_non_nullable
              as String,
      numberIdentifier: numberIdentifier == freezed
          ? _value.numberIdentifier
          : numberIdentifier // ignore: cast_nullable_to_non_nullable
              as int,
      generation: generation == freezed
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CPUCopyWith<$Res> implements $CPUCopyWith<$Res> {
  factory _$CPUCopyWith(_CPU value, $Res Function(_CPU) then) =
      __$CPUCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String brand,
      String family,
      double frequency,
      String modifier,
      int numberIdentifier,
      int generation});
}

/// @nodoc
class __$CPUCopyWithImpl<$Res> extends _$CPUCopyWithImpl<$Res>
    implements _$CPUCopyWith<$Res> {
  __$CPUCopyWithImpl(_CPU _value, $Res Function(_CPU) _then)
      : super(_value, (v) => _then(v as _CPU));

  @override
  _CPU get _value => super._value as _CPU;

  @override
  $Res call({
    Object? name = freezed,
    Object? brand = freezed,
    Object? family = freezed,
    Object? frequency = freezed,
    Object? modifier = freezed,
    Object? numberIdentifier = freezed,
    Object? generation = freezed,
  }) {
    return _then(_CPU(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      family: family == freezed
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double,
      modifier: modifier == freezed
          ? _value.modifier
          : modifier // ignore: cast_nullable_to_non_nullable
              as String,
      numberIdentifier: numberIdentifier == freezed
          ? _value.numberIdentifier
          : numberIdentifier // ignore: cast_nullable_to_non_nullable
              as int,
      generation: generation == freezed
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CPU implements _CPU {
  const _$_CPU(
      {this.name = "",
      this.brand = "",
      this.family = "",
      this.frequency = 0.0,
      this.modifier = "",
      this.numberIdentifier = 0,
      this.generation = 0});

  factory _$_CPU.fromJson(Map<String, dynamic> json) => _$$_CPUFromJson(json);

  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String brand;
  @JsonKey()
  @override
  final String family;
  @JsonKey()
  @override
  final double frequency;
  @JsonKey()
  @override
  final String modifier;
  @JsonKey()
  @override
  final int numberIdentifier;
  @JsonKey()
  @override
  final int generation;

  @override
  String toString() {
    return 'CPU(name: $name, brand: $brand, family: $family, frequency: $frequency, modifier: $modifier, numberIdentifier: $numberIdentifier, generation: $generation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CPU &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality().equals(other.family, family) &&
            const DeepCollectionEquality().equals(other.frequency, frequency) &&
            const DeepCollectionEquality().equals(other.modifier, modifier) &&
            const DeepCollectionEquality()
                .equals(other.numberIdentifier, numberIdentifier) &&
            const DeepCollectionEquality()
                .equals(other.generation, generation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(family),
      const DeepCollectionEquality().hash(frequency),
      const DeepCollectionEquality().hash(modifier),
      const DeepCollectionEquality().hash(numberIdentifier),
      const DeepCollectionEquality().hash(generation));

  @JsonKey(ignore: true)
  @override
  _$CPUCopyWith<_CPU> get copyWith =>
      __$CPUCopyWithImpl<_CPU>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CPUToJson(this);
  }
}

abstract class _CPU implements CPU {
  const factory _CPU(
      {String name,
      String brand,
      String family,
      double frequency,
      String modifier,
      int numberIdentifier,
      int generation}) = _$_CPU;

  factory _CPU.fromJson(Map<String, dynamic> json) = _$_CPU.fromJson;

  @override
  String get name;
  @override
  String get brand;
  @override
  String get family;
  @override
  double get frequency;
  @override
  String get modifier;
  @override
  int get numberIdentifier;
  @override
  int get generation;
  @override
  @JsonKey(ignore: true)
  _$CPUCopyWith<_CPU> get copyWith => throw _privateConstructorUsedError;
}
