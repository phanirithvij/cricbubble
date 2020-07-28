import 'package:cricbubble/models/batsmanstrike.dart';
import 'package:cricbubble/models/bowlerstrike.dart';
import 'package:cricbubble/models/latestperformance.dart';
import 'package:cricbubble/models/matchscoredetails.dart';

class MiniScore {
  // TODO
  final Map<String, num> batTeam;
  // TODO
  final BatsmanStrike batsmanNonStriker;
  // TODO
  final BatsmanStrike batsmanStriker;
  // TODO
  final BowlerStrike bowlerNonStriker;
  // TODO
  final BowlerStrike bowlerStriker;
  final double currentRunRate;
  final int inningsId;
  // TODO
  final List<LatestPerformance> latestPerformance;
  // TODO
  final MatchScoreDetails matchScoreDetails;
  //TODO (List type not known)
  final List overSummaryList;
  final double overs;
  final int oversRem;
  final Map<String, int> partnerShip;
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
      batTeam: json['batTeam'],
      batsmanNonStriker: json['batsmanNonStriker'],
      batsmanStriker: json['batsmanStriker'],
      bowlerNonStriker: json['bowlerNonStriker'],
      bowlerStriker: json['bowlerStriker'],
      currentRunRate: json['currentRunRate'],
      inningsId: json['inningsId'],
      latestPerformance: json['latestPerformance'],
      matchScoreDetails: json['matchScoreDetails'],
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
