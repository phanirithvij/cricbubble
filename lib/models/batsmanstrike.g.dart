// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batsmanstrike.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatsmanStrike _$BatsmanStrikeFromJson(Map<String, dynamic> json) {
  return BatsmanStrike(
    batBalls: json['batBalls'] as int,
    batDots: json['batDots'] as int,
    batFours: json['batFours'] as int,
    batId: json['batId'] as num,
    batMins: json['batMins'] as int,
    batName: json['batName'] as String,
    batRuns: json['batRuns'] as int,
    batSixes: json['batSixes'] as int,
    batStrikeRate: (json['batStrikeRate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BatsmanStrikeToJson(BatsmanStrike instance) =>
    <String, dynamic>{
      'batBalls': instance.batBalls,
      'batDots': instance.batDots,
      'batFours': instance.batFours,
      'batId': instance.batId,
      'batMins': instance.batMins,
      'batName': instance.batName,
      'batRuns': instance.batRuns,
      'batSixes': instance.batSixes,
      'batStrikeRate': instance.batStrikeRate,
    };
