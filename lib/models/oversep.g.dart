// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oversep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverSeparator _$OverSeparatorFromJson(Map<String, dynamic> json) {
  return OverSeparator(
    batNonStrikerBalls: json['batNonStrikerBalls'] as int,
    batNonStrikerIds:
        (json['batNonStrikerIds'] as List)?.map((e) => e as int)?.toList(),
    batNonStrikerNames:
        (json['batNonStrikerNames'] as List)?.map((e) => e as String)?.toList(),
    batNonStrikerRuns: json['batNonStrikerRuns'] as int,
    batStrikerBalls: json['batStrikerBalls'] as int,
    batStrikerIds:
        (json['batStrikerIds'] as List)?.map((e) => e as int)?.toList(),
    batStrikerNames:
        (json['batStrikerNames'] as List)?.map((e) => e as String)?.toList(),
    batStrikerRuns: json['batStrikerRuns'] as int,
    batTeamName: json['batTeamName'] as String,
    bowlIds: json['bowlIds'] as int,
    bowlMaidens: json['bowlMaidens'] as int,
    bowlNames: (json['bowlNames'] as List)?.map((e) => e as String)?.toList(),
    bowlOvers: json['bowlOvers'] as int,
    bowlRuns: json['bowlRuns'] as int,
    bowlWickets: json['bowlWickets'] as int,
    event: json['event'] as String,
    inningsId: json['inningsId'] as int,
    overSummary: json['overSummary'] as String,
    overNum: (json['overNum'] as num)?.toDouble(),
    runs: json['runs'] as int,
    score: json['score'] as int,
    timestamp: json['timestamp'] as int,
    wickets: json['wickets'] as int,
  );
}

Map<String, dynamic> _$OverSeparatorToJson(OverSeparator instance) =>
    <String, dynamic>{
      'batNonStrikerBalls': instance.batNonStrikerBalls,
      'batNonStrikerIds': instance.batNonStrikerIds,
      'batNonStrikerNames': instance.batNonStrikerNames,
      'batNonStrikerRuns': instance.batNonStrikerRuns,
      'batStrikerBalls': instance.batStrikerBalls,
      'batStrikerIds': instance.batStrikerIds,
      'batStrikerNames': instance.batStrikerNames,
      'batStrikerRuns': instance.batStrikerRuns,
      'batTeamName': instance.batTeamName,
      'bowlIds': instance.bowlIds,
      'bowlMaidens': instance.bowlMaidens,
      'bowlNames': instance.bowlNames,
      'bowlOvers': instance.bowlOvers,
      'bowlRuns': instance.bowlRuns,
      'bowlWickets': instance.bowlWickets,
      'event': instance.event,
      'inningsId': instance.inningsId,
      'overSummary': instance.overSummary,
      'overNum': instance.overNum,
      'runs': instance.runs,
      'score': instance.score,
      'timestamp': instance.timestamp,
      'wickets': instance.wickets,
    };
