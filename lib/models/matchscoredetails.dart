import 'package:cricbubble/models/inningscore.dart';

class MatchScoreDetails {
  final String customStatus;
  final num highlightedTeamId;
  final List<InningsScore> inningsScoreList;
  final bool isMatchNotCovered;
  final String matchFormat;
  final num matchId;

  MatchScoreDetails({
    this.customStatus,
    this.highlightedTeamId,
    this.inningsScoreList,
    this.isMatchNotCovered,
    this.matchFormat,
    this.matchId,
  });

  factory MatchScoreDetails.fromJson(Map<String, dynamic> json) {
    return MatchScoreDetails(
      customStatus: json['customStatus'],
      highlightedTeamId: json['highlightedTeamId'],
      inningsScoreList: json['inningsScoreList'],
      isMatchNotCovered: json['isMatchNotCovered'],
      matchFormat: json['matchFormat'],
      matchId: json['matchId'],
    );
  }
}
