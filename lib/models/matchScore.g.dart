// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchScore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiniScore _$MiniScoreFromJson(Map<String, dynamic> json) {
  return MiniScore(
    batTeam: BatTeam.fromJson(json['batTeam'] as Map<String, dynamic>),
    batsmanNonStriker: BatsmanStrike.fromJson(
        json['batsmanNonStriker'] as Map<String, dynamic>),
    batsmanStriker:
        BatsmanStrike.fromJson(json['batsmanStriker'] as Map<String, dynamic>),
    bowlerNonStriker:
        BowlerStrike.fromJson(json['bowlerNonStriker'] as Map<String, dynamic>),
    bowlerStriker:
        BowlerStrike.fromJson(json['bowlerStriker'] as Map<String, dynamic>),
    currentRunRate: (json['currentRunRate'] as num).toDouble(),
    inningsId: json['inningsId'] as int,
    latestPerformance: (json['latestPerformance'] as List)
        .map((e) => LatestPerformance.fromJson(e as Map<String, dynamic>))
        .toList(),
    matchScoreDetails: MatchScoreDetails.fromJson(
        json['matchScoreDetails'] as Map<String, dynamic>),
    overSummaryList: json['overSummaryList'] as List,
    overs: (json['overs'] as num).toDouble(),
    oversRem: json['oversRem'] as int,
    partnerShip: json['partnerShip'] as Map<String, dynamic>,
    ppData: json['ppData'] as Map<String, dynamic>,
    recentOvsStats: json['recentOvsStats'] as String,
    requiredRunRate: (json['requiredRunRate'] as num).toDouble(),
    target: json['target'] as int,
  );
}

Map<String, dynamic> _$MiniScoreToJson(MiniScore instance) => <String, dynamic>{
      'batTeam': instance.batTeam,
      'batsmanNonStriker': instance.batsmanNonStriker,
      'batsmanStriker': instance.batsmanStriker,
      'bowlerNonStriker': instance.bowlerNonStriker,
      'bowlerStriker': instance.bowlerStriker,
      'currentRunRate': instance.currentRunRate,
      'inningsId': instance.inningsId,
      'latestPerformance': instance.latestPerformance,
      'matchScoreDetails': instance.matchScoreDetails,
      'overSummaryList': instance.overSummaryList,
      'overs': instance.overs,
      'oversRem': instance.oversRem,
      'partnerShip': instance.partnerShip,
      'ppData': instance.ppData,
      'recentOvsStats': instance.recentOvsStats,
      'requiredRunRate': instance.requiredRunRate,
      'target': instance.target,
    };
