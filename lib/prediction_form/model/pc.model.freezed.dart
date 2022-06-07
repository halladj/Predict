// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pc.model.dart';

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
      {String brand = "",
      CPU cpu =
          const CPU(brand: "", family: "", numberIdentifier: "", modifier: ""),
      int state = 0,
      GPU gpu = const GPU(brand: "", numberIdentifier: "", vram: 0),
      int ram = 0,
      double ramFrequency = 0.0,
      String ramType = "",
      int ssd = 0,
      int hdd = 0,
      int screenRefreshRate = 0,
      double screenSize = 0.0,
      String screenResolution = "",
      int touchScreen = 0}) {
    return _PcInfo(
      brand: brand,
      cpu: cpu,
      state: state,
      gpu: gpu,
      ram: ram,
      ramFrequency: ramFrequency,
      ramType: ramType,
      ssd: ssd,
      hdd: hdd,
      screenRefreshRate: screenRefreshRate,
      screenSize: screenSize,
      screenResolution: screenResolution,
      touchScreen: touchScreen,
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
//FirstFrom
  String get brand => throw _privateConstructorUsedError;
  CPU get cpu => throw _privateConstructorUsedError;
  int get state => throw _privateConstructorUsedError;
  GPU get gpu => throw _privateConstructorUsedError;
  int get ram => throw _privateConstructorUsedError;
  double get ramFrequency =>
      throw _privateConstructorUsedError; //recheck the type (int????)
  String get ramType => throw _privateConstructorUsedError; //SeconedForm
  int get ssd => throw _privateConstructorUsedError;
  int get hdd => throw _privateConstructorUsedError;
  int get screenRefreshRate => throw _privateConstructorUsedError;
  double get screenSize => throw _privateConstructorUsedError;
  String get screenResolution => throw _privateConstructorUsedError;
  int get touchScreen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PcInfoCopyWith<PcInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PcInfoCopyWith<$Res> {
  factory $PcInfoCopyWith(PcInfo value, $Res Function(PcInfo) then) =
      _$PcInfoCopyWithImpl<$Res>;
  $Res call(
      {String brand,
      CPU cpu,
      int state,
      GPU gpu,
      int ram,
      double ramFrequency,
      String ramType,
      int ssd,
      int hdd,
      int screenRefreshRate,
      double screenSize,
      String screenResolution,
      int touchScreen});

  $CPUCopyWith<$Res> get cpu;
  $GPUCopyWith<$Res> get gpu;
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
    Object? cpu = freezed,
    Object? state = freezed,
    Object? gpu = freezed,
    Object? ram = freezed,
    Object? ramFrequency = freezed,
    Object? ramType = freezed,
    Object? ssd = freezed,
    Object? hdd = freezed,
    Object? screenRefreshRate = freezed,
    Object? screenSize = freezed,
    Object? screenResolution = freezed,
    Object? touchScreen = freezed,
  }) {
    return _then(_value.copyWith(
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      cpu: cpu == freezed
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as CPU,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
      gpu: gpu == freezed
          ? _value.gpu
          : gpu // ignore: cast_nullable_to_non_nullable
              as GPU,
      ram: ram == freezed
          ? _value.ram
          : ram // ignore: cast_nullable_to_non_nullable
              as int,
      ramFrequency: ramFrequency == freezed
          ? _value.ramFrequency
          : ramFrequency // ignore: cast_nullable_to_non_nullable
              as double,
      ramType: ramType == freezed
          ? _value.ramType
          : ramType // ignore: cast_nullable_to_non_nullable
              as String,
      ssd: ssd == freezed
          ? _value.ssd
          : ssd // ignore: cast_nullable_to_non_nullable
              as int,
      hdd: hdd == freezed
          ? _value.hdd
          : hdd // ignore: cast_nullable_to_non_nullable
              as int,
      screenRefreshRate: screenRefreshRate == freezed
          ? _value.screenRefreshRate
          : screenRefreshRate // ignore: cast_nullable_to_non_nullable
              as int,
      screenSize: screenSize == freezed
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as double,
      screenResolution: screenResolution == freezed
          ? _value.screenResolution
          : screenResolution // ignore: cast_nullable_to_non_nullable
              as String,
      touchScreen: touchScreen == freezed
          ? _value.touchScreen
          : touchScreen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $CPUCopyWith<$Res> get cpu {
    return $CPUCopyWith<$Res>(_value.cpu, (value) {
      return _then(_value.copyWith(cpu: value));
    });
  }

  @override
  $GPUCopyWith<$Res> get gpu {
    return $GPUCopyWith<$Res>(_value.gpu, (value) {
      return _then(_value.copyWith(gpu: value));
    });
  }
}

/// @nodoc
abstract class _$PcInfoCopyWith<$Res> implements $PcInfoCopyWith<$Res> {
  factory _$PcInfoCopyWith(_PcInfo value, $Res Function(_PcInfo) then) =
      __$PcInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String brand,
      CPU cpu,
      int state,
      GPU gpu,
      int ram,
      double ramFrequency,
      String ramType,
      int ssd,
      int hdd,
      int screenRefreshRate,
      double screenSize,
      String screenResolution,
      int touchScreen});

  @override
  $CPUCopyWith<$Res> get cpu;
  @override
  $GPUCopyWith<$Res> get gpu;
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
    Object? cpu = freezed,
    Object? state = freezed,
    Object? gpu = freezed,
    Object? ram = freezed,
    Object? ramFrequency = freezed,
    Object? ramType = freezed,
    Object? ssd = freezed,
    Object? hdd = freezed,
    Object? screenRefreshRate = freezed,
    Object? screenSize = freezed,
    Object? screenResolution = freezed,
    Object? touchScreen = freezed,
  }) {
    return _then(_PcInfo(
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      cpu: cpu == freezed
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as CPU,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
      gpu: gpu == freezed
          ? _value.gpu
          : gpu // ignore: cast_nullable_to_non_nullable
              as GPU,
      ram: ram == freezed
          ? _value.ram
          : ram // ignore: cast_nullable_to_non_nullable
              as int,
      ramFrequency: ramFrequency == freezed
          ? _value.ramFrequency
          : ramFrequency // ignore: cast_nullable_to_non_nullable
              as double,
      ramType: ramType == freezed
          ? _value.ramType
          : ramType // ignore: cast_nullable_to_non_nullable
              as String,
      ssd: ssd == freezed
          ? _value.ssd
          : ssd // ignore: cast_nullable_to_non_nullable
              as int,
      hdd: hdd == freezed
          ? _value.hdd
          : hdd // ignore: cast_nullable_to_non_nullable
              as int,
      screenRefreshRate: screenRefreshRate == freezed
          ? _value.screenRefreshRate
          : screenRefreshRate // ignore: cast_nullable_to_non_nullable
              as int,
      screenSize: screenSize == freezed
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as double,
      screenResolution: screenResolution == freezed
          ? _value.screenResolution
          : screenResolution // ignore: cast_nullable_to_non_nullable
              as String,
      touchScreen: touchScreen == freezed
          ? _value.touchScreen
          : touchScreen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PcInfo implements _PcInfo {
  const _$_PcInfo(
      {this.brand = "",
      this.cpu =
          const CPU(brand: "", family: "", numberIdentifier: "", modifier: ""),
      this.state = 0,
      this.gpu = const GPU(brand: "", numberIdentifier: "", vram: 0),
      this.ram = 0,
      this.ramFrequency = 0.0,
      this.ramType = "",
      this.ssd = 0,
      this.hdd = 0,
      this.screenRefreshRate = 0,
      this.screenSize = 0.0,
      this.screenResolution = "",
      this.touchScreen = 0});

  factory _$_PcInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PcInfoFromJson(json);

  @JsonKey()
  @override //FirstFrom
  final String brand;
  @JsonKey()
  @override
  final CPU cpu;
  @JsonKey()
  @override
  final int state;
  @JsonKey()
  @override
  final GPU gpu;
  @JsonKey()
  @override
  final int ram;
  @JsonKey()
  @override
  final double ramFrequency;
  @JsonKey()
  @override //recheck the type (int????)
  final String ramType;
  @JsonKey()
  @override //SeconedForm
  final int ssd;
  @JsonKey()
  @override
  final int hdd;
  @JsonKey()
  @override
  final int screenRefreshRate;
  @JsonKey()
  @override
  final double screenSize;
  @JsonKey()
  @override
  final String screenResolution;
  @JsonKey()
  @override
  final int touchScreen;

  @override
  String toString() {
    return 'PcInfo(brand: $brand, cpu: $cpu, state: $state, gpu: $gpu, ram: $ram, ramFrequency: $ramFrequency, ramType: $ramType, ssd: $ssd, hdd: $hdd, screenRefreshRate: $screenRefreshRate, screenSize: $screenSize, screenResolution: $screenResolution, touchScreen: $touchScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PcInfo &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality().equals(other.cpu, cpu) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.gpu, gpu) &&
            const DeepCollectionEquality().equals(other.ram, ram) &&
            const DeepCollectionEquality()
                .equals(other.ramFrequency, ramFrequency) &&
            const DeepCollectionEquality().equals(other.ramType, ramType) &&
            const DeepCollectionEquality().equals(other.ssd, ssd) &&
            const DeepCollectionEquality().equals(other.hdd, hdd) &&
            const DeepCollectionEquality()
                .equals(other.screenRefreshRate, screenRefreshRate) &&
            const DeepCollectionEquality()
                .equals(other.screenSize, screenSize) &&
            const DeepCollectionEquality()
                .equals(other.screenResolution, screenResolution) &&
            const DeepCollectionEquality()
                .equals(other.touchScreen, touchScreen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(cpu),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(gpu),
      const DeepCollectionEquality().hash(ram),
      const DeepCollectionEquality().hash(ramFrequency),
      const DeepCollectionEquality().hash(ramType),
      const DeepCollectionEquality().hash(ssd),
      const DeepCollectionEquality().hash(hdd),
      const DeepCollectionEquality().hash(screenRefreshRate),
      const DeepCollectionEquality().hash(screenSize),
      const DeepCollectionEquality().hash(screenResolution),
      const DeepCollectionEquality().hash(touchScreen));

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
  const factory _PcInfo(
      {String brand,
      CPU cpu,
      int state,
      GPU gpu,
      int ram,
      double ramFrequency,
      String ramType,
      int ssd,
      int hdd,
      int screenRefreshRate,
      double screenSize,
      String screenResolution,
      int touchScreen}) = _$_PcInfo;

  factory _PcInfo.fromJson(Map<String, dynamic> json) = _$_PcInfo.fromJson;

  @override //FirstFrom
  String get brand;
  @override
  CPU get cpu;
  @override
  int get state;
  @override
  GPU get gpu;
  @override
  int get ram;
  @override
  double get ramFrequency;
  @override //recheck the type (int????)
  String get ramType;
  @override //SeconedForm
  int get ssd;
  @override
  int get hdd;
  @override
  int get screenRefreshRate;
  @override
  double get screenSize;
  @override
  String get screenResolution;
  @override
  int get touchScreen;
  @override
  @JsonKey(ignore: true)
  _$PcInfoCopyWith<_PcInfo> get copyWith => throw _privateConstructorUsedError;
}
