// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gpu.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GPU _$GPUFromJson(Map<String, dynamic> json) {
  return _GPU.fromJson(json);
}

/// @nodoc
class _$GPUTearOff {
  const _$GPUTearOff();

  _GPU call(
      {String name = "",
      String brand = "",
      String numberIdentifier = "",
      int vram = 0}) {
    return _GPU(
      name: name,
      brand: brand,
      numberIdentifier: numberIdentifier,
      vram: vram,
    );
  }

  GPU fromJson(Map<String, Object?> json) {
    return GPU.fromJson(json);
  }
}

/// @nodoc
const $GPU = _$GPUTearOff();

/// @nodoc
mixin _$GPU {
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get numberIdentifier => throw _privateConstructorUsedError;
  int get vram => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GPUCopyWith<GPU> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GPUCopyWith<$Res> {
  factory $GPUCopyWith(GPU value, $Res Function(GPU) then) =
      _$GPUCopyWithImpl<$Res>;
  $Res call({String name, String brand, String numberIdentifier, int vram});
}

/// @nodoc
class _$GPUCopyWithImpl<$Res> implements $GPUCopyWith<$Res> {
  _$GPUCopyWithImpl(this._value, this._then);

  final GPU _value;
  // ignore: unused_field
  final $Res Function(GPU) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? brand = freezed,
    Object? numberIdentifier = freezed,
    Object? vram = freezed,
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
      numberIdentifier: numberIdentifier == freezed
          ? _value.numberIdentifier
          : numberIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      vram: vram == freezed
          ? _value.vram
          : vram // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GPUCopyWith<$Res> implements $GPUCopyWith<$Res> {
  factory _$GPUCopyWith(_GPU value, $Res Function(_GPU) then) =
      __$GPUCopyWithImpl<$Res>;
  @override
  $Res call({String name, String brand, String numberIdentifier, int vram});
}

/// @nodoc
class __$GPUCopyWithImpl<$Res> extends _$GPUCopyWithImpl<$Res>
    implements _$GPUCopyWith<$Res> {
  __$GPUCopyWithImpl(_GPU _value, $Res Function(_GPU) _then)
      : super(_value, (v) => _then(v as _GPU));

  @override
  _GPU get _value => super._value as _GPU;

  @override
  $Res call({
    Object? name = freezed,
    Object? brand = freezed,
    Object? numberIdentifier = freezed,
    Object? vram = freezed,
  }) {
    return _then(_GPU(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      numberIdentifier: numberIdentifier == freezed
          ? _value.numberIdentifier
          : numberIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      vram: vram == freezed
          ? _value.vram
          : vram // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GPU implements _GPU {
  const _$_GPU(
      {this.name = "",
      this.brand = "",
      this.numberIdentifier = "",
      this.vram = 0});

  factory _$_GPU.fromJson(Map<String, dynamic> json) => _$$_GPUFromJson(json);

  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String brand;
  @JsonKey()
  @override
  final String numberIdentifier;
  @JsonKey()
  @override
  final int vram;

  @override
  String toString() {
    return 'GPU(name: $name, brand: $brand, numberIdentifier: $numberIdentifier, vram: $vram)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GPU &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality()
                .equals(other.numberIdentifier, numberIdentifier) &&
            const DeepCollectionEquality().equals(other.vram, vram));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(numberIdentifier),
      const DeepCollectionEquality().hash(vram));

  @JsonKey(ignore: true)
  @override
  _$GPUCopyWith<_GPU> get copyWith =>
      __$GPUCopyWithImpl<_GPU>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GPUToJson(this);
  }
}

abstract class _GPU implements GPU {
  const factory _GPU(
      {String name, String brand, String numberIdentifier, int vram}) = _$_GPU;

  factory _GPU.fromJson(Map<String, dynamic> json) = _$_GPU.fromJson;

  @override
  String get name;
  @override
  String get brand;
  @override
  String get numberIdentifier;
  @override
  int get vram;
  @override
  @JsonKey(ignore: true)
  _$GPUCopyWith<_GPU> get copyWith => throw _privateConstructorUsedError;
}
