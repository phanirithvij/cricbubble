// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latestperformance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestPerformance _$LatestPerformanceFromJson(Map<String, dynamic> json) {
  return LatestPerformance(
    label: json['label'] as String,
    runs: json['runs'] as int,
    wkts: json['wkts'] as int,
  );
}

Map<String, dynamic> _$LatestPerformanceToJson(LatestPerformance instance) =>
    <String, dynamic>{
      'label': instance.label,
      'runs': instance.runs,
      'wkts': instance.wkts,
    };
