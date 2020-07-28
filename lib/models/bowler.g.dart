// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bowler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bowler _$BowlerFromJson(Map<String, dynamic> json) {
  return Bowler(
    bowlId: json['bowlId'] as int,
    bowlMaidens: json['bowlMaidens'] as int,
    bowlName: json['bowlName'] as String,
    bowlNoballs: json['bowlNoballs'] as int,
    bowlOvs: json['bowlOvs'] as int,
    bowlRuns: json['bowlRuns'] as int,
    bowlWides: json['bowlWides'] as int,
    bowlWkts: json['bowlWkts'] as int,
  );
}

Map<String, dynamic> _$BowlerToJson(Bowler instance) => <String, dynamic>{
      'bowlId': instance.bowlId,
      'bowlMaidens': instance.bowlMaidens,
      'bowlName': instance.bowlName,
      'bowlNoballs': instance.bowlNoballs,
      'bowlOvs': instance.bowlOvs,
      'bowlRuns': instance.bowlRuns,
      'bowlWides': instance.bowlWides,
      'bowlWkts': instance.bowlWkts,
    };
