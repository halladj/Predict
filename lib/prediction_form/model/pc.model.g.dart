// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pc.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PcInfo _$$_PcInfoFromJson(Map<String, dynamic> json) => _$_PcInfo(
      brand: json['brand'] as String? ?? "",
      cpuBrand: json['cpuBrand'] as String? ?? "",
      cpuFamily: json['cpuFamily'] as String? ?? "",
      cpuFrequency: (json['cpuFrequency'] as num?)?.toDouble() ?? 0.0,
      cpuModifier: json['cpuModifier'] as String? ?? "",
      cpuNumberIdentifier: json['cpuNumberIdentifier'] as String? ?? "",
      gpuBrand: json['gpuBrand'] as String? ?? "",
      gpuNumberIdentifier: json['gpuNumberIdentifier'] as String? ?? "",
      gpuVram: json['gpuVram'] as int? ?? 0,
      gpuWordsIdentifier: json['gpuWordsIdentifier'] as String? ?? "",
      hdd: json['hdd'] as int? ?? 0,
      ssd: json['ssd'] as int? ?? 0,
      ram: json['ram'] as int? ?? 0,
      ramFrequency: (json['ramFrequency'] as num?)?.toDouble() ?? 0.0,
      ramType: json['ramType'] as String? ?? "",
      screenRefreshRate: json['screenRefreshRate'] as int? ?? 0,
      screenSize: (json['screenSize'] as num?)?.toDouble() ?? 0.0,
      screenResolution: json['screenResolution'] as String? ?? "",
      touchScreen: json['touchScreen'] as bool? ?? false,
      state: json['state'] as bool? ?? false,
      antiGlare: json['antiGlare'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PcInfoToJson(_$_PcInfo instance) => <String, dynamic>{
      'brand': instance.brand,
      'cpuBrand': instance.cpuBrand,
      'cpuFamily': instance.cpuFamily,
      'cpuFrequency': instance.cpuFrequency,
      'cpuModifier': instance.cpuModifier,
      'cpuNumberIdentifier': instance.cpuNumberIdentifier,
      'gpuBrand': instance.gpuBrand,
      'gpuNumberIdentifier': instance.gpuNumberIdentifier,
      'gpuVram': instance.gpuVram,
      'gpuWordsIdentifier': instance.gpuWordsIdentifier,
      'hdd': instance.hdd,
      'ssd': instance.ssd,
      'ram': instance.ram,
      'ramFrequency': instance.ramFrequency,
      'ramType': instance.ramType,
      'screenRefreshRate': instance.screenRefreshRate,
      'screenSize': instance.screenSize,
      'screenResolution': instance.screenResolution,
      'touchScreen': instance.touchScreen,
      'state': instance.state,
      'antiGlare': instance.antiGlare,
    };
