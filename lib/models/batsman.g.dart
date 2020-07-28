// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batsman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Batsman _$BatsmanFromJson(Map<String, dynamic> json) {
  return Batsman(
    batBalls: json['batBalls'] as int,
    batFours: json['batFours'] as int,
    batId: json['batId'] as int,
    batName: json['batName'] as String,
    batRuns: json['batRuns'] as int,
    batSixes: json['batSixes'] as int,
    batStrikeRate: (json['batStrikeRate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BatsmanToJson(Batsman instance) => <String, dynamic>{
      'batBalls': instance.batBalls,
      'batFours': instance.batFours,
      'batId': instance.batId,
      'batName': instance.batName,
      'batRuns': instance.batRuns,
      'batSixes': instance.batSixes,
      'batStrikeRate': instance.batStrikeRate,
    };
