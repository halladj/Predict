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
    @Default(0)
        int gpuVram, //possibe problem here check it latter <<seconedForm>>
    @Default("") String gpuWordsIdentifier,
    @Default(0) int ram,
    @Default(0.0) double ramFrequency, //recheck the type (int????)
    @Default("") String ramType,
    //TODO add these to the ThirdForm
    @Default(0) int ssd,
    @Default(0) int screenRefreshRate,
    @Default(0.0) double screenSize,
    @Default("") String screenResolution,
    @Default(0) int antiGlare,
    @Default(0) int touchScreen,
    @Default(0) int state,
  }) = _PcInfo;

  factory PcInfo.fromJson(Map<String, dynamic> json) => _$PcInfoFromJson(json);
}

