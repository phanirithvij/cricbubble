// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchscoredetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchScoreDetails _$MatchScoreDetailsFromJson(Map<String, dynamic> json) {
  return MatchScoreDetails(
    customStatus: json['customStatus'] as String,
    highlightedTeamId: json['highlightedTeamId'] as num,
    inningsScoreList: (json['inningsScoreList'] as List)
        .map((e) => InningsScore.fromJson(e as Map<String, dynamic>))
        .toList(),
    isMatchNotCovered: json['isMatchNotCovered'] as bool,
    matchFormat: json['matchFormat'] as String,
    matchId: json['matchId'] as num,
  );
}

Map<String, dynamic> _$MatchScoreDetailsToJson(MatchScoreDetails instance) =>
    <String, dynamic>{
      'customStatus': instance.customStatus,
      'highlightedTeamId': instance.highlightedTeamId,
      'inningsScoreList': instance.inningsScoreList,
      'isMatchNotCovered': instance.isMatchNotCovered,
      'matchFormat': instance.matchFormat,
      'matchId': instance.matchId,
    };
