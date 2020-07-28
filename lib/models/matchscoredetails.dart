import 'package:cricbubble/models/inningscore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'matchscoredetails.g.dart';

@JsonSerializable(nullable: false)
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

  factory MatchScoreDetails.fromJson(Map<String, dynamic> json) =>
      _$MatchScoreDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MatchScoreDetailsToJson(this);
}
