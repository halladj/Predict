// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'prediction_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PcInfo _$PcInfoFromJson(Map<String, dynamic> json) {
  return _PcInfo.fromJson(json);
}

/// @nodoc
class _$PcInfoTearOff {
  const _$PcInfoTearOff();

  _PcInfo call(
      {String brand = "", String cpuBrand = "", String gpuBrand = ""}) {
    return _PcInfo(
      brand: brand,
      cpuBrand: cpuBrand,
      gpuBrand: gpuBrand,
    );
  }

  PcInfo fromJson(Map<String, Object?> json) {
    return PcInfo.fromJson(json);
  }
}

/// @nodoc
const $PcInfo = _$PcInfoTearOff();

/// @nodoc
mixin _$PcInfo {
  String get brand => throw _privateConstructorUsedError;
  String get cpuBrand => throw _privateConstructorUsedError;
  String get gpuBrand => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PcInfoCopyWith<PcInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PcInfoCopyWith<$Res> {
  factory $PcInfoCopyWith(PcInfo value, $Res Function(PcInfo) then) =
      _$PcInfoCopyWithImpl<$Res>;
  $Res call({String brand, String cpuBrand, String gpuBrand});
}

/// @nodoc
class _$PcInfoCopyWithImpl<$Res> implements $PcInfoCopyWith<$Res> {
  _$PcInfoCopyWithImpl(this._value, this._then);

  final PcInfo _value;
  // ignore: unused_field
  final $Res Function(PcInfo) _then;

  @override
  $Res call({
    Object? brand = freezed,
    Object? cpuBrand = freezed,
    Object? gpuBrand = freezed,
  }) {
    return _then(_value.copyWith(
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      cpuBrand: cpuBrand == freezed
          ? _value.cpuBrand
          : cpuBrand // ignore: cast_nullable_to_non_nullable
              as String,
      gpuBrand: gpuBrand == freezed
          ? _value.gpuBrand
          : gpuBrand // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PcInfoCopyWith<$Res> implements $PcInfoCopyWith<$Res> {
  factory _$PcInfoCopyWith(_PcInfo value, $Res Function(_PcInfo) then) =
      __$PcInfoCopyWithImpl<$Res>;
  @override
  $Res call({String brand, String cpuBrand, String gpuBrand});
}

/// @nodoc
class __$PcInfoCopyWithImpl<$Res> extends _$PcInfoCopyWithImpl<$Res>
    implements _$PcInfoCopyWith<$Res> {
  __$PcInfoCopyWithImpl(_PcInfo _value, $Res Function(_PcInfo) _then)
      : super(_value, (v) => _then(v as _PcInfo));

  @override
  _PcInfo get _value => super._value as _PcInfo;

  @override
  $Res call({
    Object? brand = freezed,
    Object? cpuBrand = freezed,
    Object? gpuBrand = freezed,
  }) {
    return _then(_PcInfo(
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      cpuBrand: cpuBrand == freezed
          ? _value.cpuBrand
          : cpuBrand // ignore: cast_nullable_to_non_nullable
              as String,
      gpuBrand: gpuBrand == freezed
          ? _value.gpuBrand
          : gpuBrand // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PcInfo implements _PcInfo {
  const _$_PcInfo({this.brand = "", this.cpuBrand = "", this.gpuBrand = ""});

  factory _$_PcInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PcInfoFromJson(json);

  @JsonKey()
  @override
  final String brand;
  @JsonKey()
  @override
  final String cpuBrand;
  @JsonKey()
  @override
  final String gpuBrand;

  @override
  String toString() {
    return 'PcInfo(brand: $brand, cpuBrand: $cpuBrand, gpuBrand: $gpuBrand)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PcInfo &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality().equals(other.cpuBrand, cpuBrand) &&
            const DeepCollectionEquality().equals(other.gpuBrand, gpuBrand));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(cpuBrand),
      const DeepCollectionEquality().hash(gpuBrand));

  @JsonKey(ignore: true)
  @override
  _$PcInfoCopyWith<_PcInfo> get copyWith =>
      __$PcInfoCopyWithImpl<_PcInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PcInfoToJson(this);
  }
}

abstract class _PcInfo implements PcInfo {
  const factory _PcInfo({String brand, String cpuBrand, String gpuBrand}) =
      _$_PcInfo;

  factory _PcInfo.fromJson(Map<String, dynamic> json) = _$_PcInfo.fromJson;

  @override
  String get brand;
  @override
  String get cpuBrand;
  @override
  String get gpuBrand;
  @override
  @JsonKey(ignore: true)
  _$PcInfoCopyWith<_PcInfo> get copyWith => throw _privateConstructorUsedError;
}
