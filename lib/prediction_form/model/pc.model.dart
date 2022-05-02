import 'package:freezed_annotation/freezed_annotation.dart';
import './cpu/cpu.model.dart';
import './gpu/gpu.model.dart';

part 'pc.model.freezed.dart';
part 'pc.model.g.dart';

@freezed
class PcInfo with _$PcInfo {
  const factory PcInfo({
    //FirstFrom
    @Default("") String brand,
    @Default(CPU(
        brand: "",
        frequency: 0.0,
        family: "",
        generation: 0,
        numberIdentifier: 0,
        modifier: "")) CPU cpu,
    @Default(0) int state,
    @Default(GPU(
        brand: "",
        wordsIdentifier: "",
        numberIdentifier: "",
        vram: 0,
        frequency: 0.0)) GPU gpu,
    @Default(0) int ram,
    @Default(0.0) double ramFrequency, //recheck the type (int????)
    @Default("") String ramType,
    //SeconedForm
    @Default(0) int ssd,
    @Default(0) int hdd,
    @Default(0) int screenRefreshRate,
    @Default(0.0) double screenSize,
    @Default("") String screenResolution,
    @Default(0) int antiGlare,
    @Default(0) int touchScreen,
  }) = _PcInfo;

  factory PcInfo.fromJson(Map<String, dynamic> json) => _$PcInfoFromJson(json);
}

