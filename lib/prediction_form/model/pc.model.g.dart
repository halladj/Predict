// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pc.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PcInfo _$$_PcInfoFromJson(Map<String, dynamic> json) => _$_PcInfo(
      brand: json['brand'] as String? ?? "",
      cpu: json['cpu'] == null
          ? const CPU(brand: "", family: "", numberIdentifier: "", modifier: "")
          : CPU.fromJson(json['cpu'] as Map<String, dynamic>),
      state: json['state'] as int? ?? 0,
      gpu: json['gpu'] == null
          ? const GPU(brand: "", numberIdentifier: "", vram: 0)
          : GPU.fromJson(json['gpu'] as Map<String, dynamic>),
      ram: json['ram'] as int? ?? 0,
      ramFrequency: (json['ramFrequency'] as num?)?.toDouble() ?? 0.0,
      ramType: json['ramType'] as String? ?? "",
      ssd: json['ssd'] as int? ?? 0,
      hdd: json['hdd'] as int? ?? 0,
      screenRefreshRate: json['screenRefreshRate'] as int? ?? 0,
      screenSize: (json['screenSize'] as num?)?.toDouble() ?? 0.0,
      screenResolution: json['screenResolution'] as String? ?? "",
      touchScreen: json['touchScreen'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PcInfoToJson(_$_PcInfo instance) => <String, dynamic>{
      'brand': instance.brand,
      'cpu': instance.cpu,
      'state': instance.state,
      'gpu': instance.gpu,
      'ram': instance.ram,
      'ramFrequency': instance.ramFrequency,
      'ramType': instance.ramType,
      'ssd': instance.ssd,
      'hdd': instance.hdd,
      'screenRefreshRate': instance.screenRefreshRate,
      'screenSize': instance.screenSize,
      'screenResolution': instance.screenResolution,
      'touchScreen': instance.touchScreen,
    };
