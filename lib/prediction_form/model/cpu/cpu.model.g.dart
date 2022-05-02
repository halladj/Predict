// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cpu.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CPU _$$_CPUFromJson(Map<String, dynamic> json) => _$_CPU(
      name: json['name'] as String? ?? "",
      brand: json['brand'] as String? ?? "",
      family: json['family'] as String? ?? "",
      frequency: (json['frequency'] as num?)?.toDouble() ?? 0.0,
      modifier: json['modifier'] as String? ?? "",
      numberIdentifier: json['numberIdentifier'] as int? ?? 0,
      generation: json['generation'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CPUToJson(_$_CPU instance) => <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'family': instance.family,
      'frequency': instance.frequency,
      'modifier': instance.modifier,
      'numberIdentifier': instance.numberIdentifier,
      'generation': instance.generation,
    };
