// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchteam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchTeamInfo _$MatchTeamInfoFromJson(Map<String, dynamic> json) {
  return MatchTeamInfo(
    battingTeamId: json['battingTeamId'] as num,
    battingTeamShortName: json['battingTeamShortName'] as String,
    bowlingTeamId: json['bowlingTeamId'] as num,
    bowlingTeamShortName: json['bowlingTeamShortName'] as String,
  );
}

Map<String, dynamic> _$MatchTeamInfoToJson(MatchTeamInfo instance) =>
    <String, dynamic>{
      'battingTeamId': instance.battingTeamId,
      'battingTeamShortName': instance.battingTeamShortName,
      'bowlingTeamId': instance.bowlingTeamId,
      'bowlingTeamShortName': instance.bowlingTeamShortName,
    };
