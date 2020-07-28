import 'package:json_annotation/json_annotation.dart';

part 'inningscore.g.dart';

@JsonSerializable(nullable: false)
class InningsScore {
  final num batTeamId;
  final String batTeamName;
  final num inningsId;
  final bool isDeclared;
  final bool isFollowOn;
  final num overs;
  final int score;
  final int wickets;

  InningsScore({
    this.batTeamId,
    this.batTeamName,
    this.inningsId,
    this.isDeclared,
    this.isFollowOn,
    this.overs,
    this.score,
    this.wickets,
  });

  factory InningsScore.fromJson(Map<String, dynamic> json) =>
      _$InningsScoreFromJson(json);
  Map<String, dynamic> toJson() => _$InningsScoreToJson(this);
}
