// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batteam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatTeam _$BatTeamFromJson(Map<String, dynamic> json) {
  return BatTeam(
    teamId: json['teamId'] as num,
    teamScore: json['teamScore'] as int,
    teamWkts: json['teamWkts'] as int,
  );
}

Map<String, dynamic> _$BatTeamToJson(BatTeam instance) => <String, dynamic>{
      'teamId': instance.teamId,
      'teamScore': instance.teamScore,
      'teamWkts': instance.teamWkts,
    };
