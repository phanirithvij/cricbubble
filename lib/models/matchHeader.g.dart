// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchHeader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchHeader _$MatchHeaderFromJson(Map<String, dynamic> json) {
  return MatchHeader(
    complete: json['complete'] as bool,
    dayNight: json['dayNight'] as bool,
    dayNumber: json['dayNumber'] as int,
    domestic: json['domestic'] as bool,
    isMatchNotCovered: json['isMatchNotCovered'] as bool,
    matchCompleteTimestamp: json['matchCompleteTimestamp'] as num,
    matchDescription: json['matchDescription'] as String,
    matchFormat: json['matchFormat'] as String,
    matchId: json['matchId'] as int,
    matchStartTimestamp: json['matchStartTimestamp'] as num,
    matchTeamInfo: (json['matchTeamInfo'] as List)
        .map((e) => MatchTeamInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    matchType: json['matchType'] as String,
    playersOfTheMatch: (json['playersOfTheMatch'] as List)
        .map((e) => MatchPlayer.fromJson(e as Map<String, dynamic>))
        .toList(),
    playersOfTheSeries: (json['playersOfTheSeries'] as List)
        .map((e) => SeriesPlayer.fromJson(e as Map<String, dynamic>))
        .toList(),
    result: Result.fromJson(json['result'] as Map<String, dynamic>),
    revisedTarget:
        RevisedTarget.fromJson(json['revisedTarget'] as Map<String, dynamic>),
    seriesDesc: json['seriesDesc'] as String,
    state: json['state'] as String,
    status: json['status'] as String,
    team1: Team.fromJson(json['team1'] as Map<String, dynamic>),
    team2: Team.fromJson(json['team2'] as Map<String, dynamic>),
    tossResults:
        TossResults.fromJson(json['tossResults'] as Map<String, dynamic>),
    year: json['year'] as int,
  );
}

Map<String, dynamic> _$MatchHeaderToJson(MatchHeader instance) =>
    <String, dynamic>{
      'complete': instance.complete,
      'dayNight': instance.dayNight,
      'dayNumber': instance.dayNumber,
      'domestic': instance.domestic,
      'isMatchNotCovered': instance.isMatchNotCovered,
      'matchCompleteTimestamp': instance.matchCompleteTimestamp,
      'matchDescription': instance.matchDescription,
      'matchFormat': instance.matchFormat,
      'matchId': instance.matchId,
      'matchStartTimestamp': instance.matchStartTimestamp,
      'matchTeamInfo': instance.matchTeamInfo,
      'matchType': instance.matchType,
      'playersOfTheMatch': instance.playersOfTheMatch,
      'playersOfTheSeries': instance.playersOfTheSeries,
      'result': instance.result,
      'revisedTarget': instance.revisedTarget,
      'seriesDesc': instance.seriesDesc,
      'state': instance.state,
      'status': instance.status,
      'team1': instance.team1,
      'team2': instance.team2,
      'tossResults': instance.tossResults,
      'year': instance.year,
    };

RevisedTarget _$RevisedTargetFromJson(Map<String, dynamic> json) {
  return RevisedTarget(
    reason: json['reason'] as String,
  );
}

Map<String, dynamic> _$RevisedTargetToJson(RevisedTarget instance) =>
    <String, dynamic>{
      'reason': instance.reason,
    };

MatchPlayer _$MatchPlayerFromJson(Map<String, dynamic> json) {
  return MatchPlayer(
    captain: json['captain'] as bool,
    faceImageId: json['faceImageId'] as num,
    fullName: json['fullName'] as String,
    id: json['id'] as num,
    keeper: json['keeper'] as bool,
    name: json['name'] as String,
    nickName: json['nickName'] as String,
    substitute: json['substitute'] as bool,
    teamName: json['teamName'] as String,
  );
}

Map<String, dynamic> _$MatchPlayerToJson(MatchPlayer instance) =>
    <String, dynamic>{
      'captain': instance.captain,
      'faceImageId': instance.faceImageId,
      'fullName': instance.fullName,
      'id': instance.id,
      'keeper': instance.keeper,
      'name': instance.name,
      'nickName': instance.nickName,
      'substitute': instance.substitute,
      'teamName': instance.teamName,
    };

SeriesPlayer _$SeriesPlayerFromJson(Map<String, dynamic> json) {
  return SeriesPlayer(
    fullName: json['fullName'] as String,
    id: json['id'] as num,
    keeper: json['keeper'] as bool,
    name: json['name'] as String,
    nickName: json['nickName'] as String,
    role: json['role'] as String,
    teamId: json['teamId'] as num,
    teamName: json['teamName'] as String,
    battingStyle: json['battingStyle'] as String,
    bowlingStyle: json['bowlingStyle'] as String,
    captain: json['captain'] as bool,
    faceImageId: json['faceImageId'] as num,
  );
}

Map<String, dynamic> _$SeriesPlayerToJson(SeriesPlayer instance) =>
    <String, dynamic>{
      'battingStyle': instance.battingStyle,
      'bowlingStyle': instance.bowlingStyle,
      'captain': instance.captain,
      'faceImageId': instance.faceImageId,
      'fullName': instance.fullName,
      'id': instance.id,
      'keeper': instance.keeper,
      'name': instance.name,
      'nickName': instance.nickName,
      'role': instance.role,
      'teamId': instance.teamId,
      'teamName': instance.teamName,
    };
