import 'package:cricbubble/models/batsmanstrike.dart';
import 'package:cricbubble/models/batteam.dart';
import 'package:cricbubble/models/bowlerstrike.dart';
import 'package:cricbubble/models/latestperformance.dart';
import 'package:cricbubble/models/matchscoredetails.dart';

class MiniScore {
  final BatTeam batTeam;
  final BatsmanStrike batsmanNonStriker;
  final BatsmanStrike batsmanStriker;
  final BowlerStrike bowlerNonStriker;
  final BowlerStrike bowlerStriker;
  final double currentRunRate;
  final int inningsId;
  final List<LatestPerformance> latestPerformance;
  final MatchScoreDetails matchScoreDetails;
  //TODO (List type not known)
  final List overSummaryList;
  final double overs;
  final int oversRem;
  // TODO
  final Map partnerShip;
  // TODO (Map intri not known)
  final Map ppData;
  final String recentOvsStats;
  final double requiredRunRate;
  final int target;

  MiniScore({
    this.batTeam,
    this.batsmanNonStriker,
    this.batsmanStriker,
    this.bowlerNonStriker,
    this.bowlerStriker,
    this.currentRunRate,
    this.inningsId,
    this.latestPerformance,
    this.matchScoreDetails,
    this.overSummaryList,
    this.overs,
    this.oversRem,
    this.partnerShip,
    this.ppData,
    this.recentOvsStats,
    this.requiredRunRate,
    this.target,
  });
  factory MiniScore.fromJson(Map<String, dynamic> json) {
    return MiniScore(
      batTeam: BatTeam.fromJson(json['batTeam']),
      batsmanNonStriker: BatsmanStrike.fromJson(json['batsmanNonStriker']),
      batsmanStriker: BatsmanStrike.fromJson(json['batsmanStriker']),
      bowlerNonStriker: BowlerStrike.fromJson(json['bowlerNonStriker']),
      bowlerStriker: BowlerStrike.fromJson(json['bowlerStriker']),
      currentRunRate: json['currentRunRate'],
      inningsId: json['inningsId'],
      latestPerformance: (json['latestPerformance'] as List)
          .map((x) => LatestPerformance.fromJson(x))
          .toList(),
      matchScoreDetails: MatchScoreDetails.fromJson(json['matchScoreDetails']),
      overSummaryList: json['overSummaryList'],
      overs: json['overs'],
      oversRem: json['oversRem'],
      partnerShip: json['partnerShip'],
      ppData: json['ppData'],
      recentOvsStats: json['recentOvsStats'],
      requiredRunRate: json['requiredRunRate'],
      target: json['target'],
    );
  }
}
