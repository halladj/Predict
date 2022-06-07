import 'package:freezed_annotation/freezed_annotation.dart';

part 'cpu.model.freezed.dart';
part 'cpu.model.g.dart';

@freezed
class CPU with _$CPU {
  const factory CPU({
    @Default("") String name,
    @Default("") String brand,
    @Default("") String family,
    @Default("") String modifier,
    @Default("") String numberIdentifier,
  }) = _CPU;

  factory CPU.fromJson(Map<String, dynamic> json) => _$CPUFromJson(json);
}
