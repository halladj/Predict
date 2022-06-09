import 'package:freezed_annotation/freezed_annotation.dart';

part 'gpu.model.freezed.dart';
part 'gpu.model.g.dart';

@freezed
class GPU with _$GPU {
  const factory GPU({
    @Default("") String name,
    @Default("") String brand,
    @Default("") String numberIdentifier,
    @Default(0) int vram,
  }) = _GPU;

  factory GPU.fromJson(Map<String, dynamic> json) => _$GPUFromJson(json);
}
