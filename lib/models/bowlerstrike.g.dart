// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bowlerstrike.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BowlerStrike _$BowlerStrikeFromJson(Map<String, dynamic> json) {
  return BowlerStrike(
    bowlEcon: (json['bowlEcon'] as num)?.toDouble(),
    bowlId: json['bowlId'] as num,
    bowlMaidens: json['bowlMaidens'] as int,
    bowlName: json['bowlName'] as String,
    bowlNoballs: json['bowlNoballs'] as int,
    bowlOvs: (json['bowlOvs'] as num)?.toDouble(),
    bowlRuns: json['bowlRuns'] as int,
    bowlWides: json['bowlWides'] as int,
    bowlWkts: json['bowlWkts'] as int,
  );
}

Map<String, dynamic> _$BowlerStrikeToJson(BowlerStrike instance) =>
    <String, dynamic>{
      'bowlEcon': instance.bowlEcon,
      'bowlId': instance.bowlId,
      'bowlMaidens': instance.bowlMaidens,
      'bowlName': instance.bowlName,
      'bowlNoballs': instance.bowlNoballs,
      'bowlOvs': instance.bowlOvs,
      'bowlRuns': instance.bowlRuns,
      'bowlWides': instance.bowlWides,
      'bowlWkts': instance.bowlWkts,
    };
