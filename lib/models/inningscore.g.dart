// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inningscore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InningsScore _$InningsScoreFromJson(Map<String, dynamic> json) {
  return InningsScore(
    batTeamId: json['batTeamId'] as num,
    batTeamName: json['batTeamName'] as String,
    inningsId: json['inningsId'] as num,
    isDeclared: json['isDeclared'] as bool,
    isFollowOn: json['isFollowOn'] as bool,
    overs: json['overs'] as num,
    score: json['score'] as int,
    wickets: json['wickets'] as int,
  );
}

Map<String, dynamic> _$InningsScoreToJson(InningsScore instance) =>
    <String, dynamic>{
      'batTeamId': instance.batTeamId,
      'batTeamName': instance.batTeamName,
      'inningsId': instance.inningsId,
      'isDeclared': instance.isDeclared,
      'isFollowOn': instance.isFollowOn,
      'overs': instance.overs,
      'score': instance.score,
      'wickets': instance.wickets,
    };
