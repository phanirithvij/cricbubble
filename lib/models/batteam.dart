import 'package:json_annotation/json_annotation.dart';

part 'batteam.g.dart';

@JsonSerializable(nullable: true)
class BatTeam {
  final num teamId;
  final int teamScore;
  final int teamWkts;

  BatTeam({
    this.teamId,
    this.teamScore,
    this.teamWkts,
  });

  factory BatTeam.fromJson(Map<String, dynamic> json) =>
      _$BatTeamFromJson(json);
  Map<String, dynamic> toJson() => _$BatTeamToJson(this);
}
