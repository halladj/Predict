import 'package:freezed_annotation/freezed_annotation.dart';

part 'pc.model.freezed.dart';
part 'pc.model.g.dart';

@freezed
class PcInfo with _$PcInfo {
  const factory PcInfo({
    //TODO add these to the FirstFrom
    @Default("") String brand,
    @Default("") String cpuBrand,
    @Default("") String cpuFamily,
    @Default(0.0) double cpuFrequency,
    @Default("") String cpuModifier,
    @Default("") String cpuNumberIdentifier,
    @Default(0) int hdd,
    //TODO add these to SeconedForm
    @Default("") String gpuBrand,
    @Default("") String gpuNumberIdentifier,
    @Default(0) int gpuVram,
    @Default("") String gpuWordsIdentifier,
    @Default(0) int ram,
    @Default(0.0) double ramFrequency,
    @Default("") String ramType,
    //TODO add these to the ThirdForm
    @Default(0) int ssd,
    @Default(0) int screenRefreshRate,
    @Default(0.0) double screenSize,
    @Default("") String screenResolution,
    @Default(false) bool antiGlare,
    @Default(false) bool touchScreen,
    @Default(false) bool state,
  }) = _PcInfo;

  factory PcInfo.fromJson(Map<String, dynamic> json) => _$PcInfoFromJson(json);
}

