// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpu.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GPU _$$_GPUFromJson(Map<String, dynamic> json) => _$_GPU(
      name: json['name'] as String? ?? "",
      brand: json['brand'] as String? ?? "",
      numberIdentifier: json['numberIdentifier'] as String? ?? "",
      vram: json['vram'] as int? ?? 0,
    );

Map<String, dynamic> _$$_GPUToJson(_$_GPU instance) => <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'numberIdentifier': instance.numberIdentifier,
      'vram': instance.vram,
    };
