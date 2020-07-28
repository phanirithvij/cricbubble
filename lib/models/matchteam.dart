import 'package:json_annotation/json_annotation.dart';

part 'matchteam.g.dart';

@JsonSerializable(nullable: false)
class MatchTeamInfo {
  final num battingTeamId;
  final String battingTeamShortName;
  final num bowlingTeamId;
  final String bowlingTeamShortName;

  MatchTeamInfo({
    this.battingTeamId,
    this.battingTeamShortName,
    this.bowlingTeamId,
    this.bowlingTeamShortName,
  });

  factory MatchTeamInfo.fromJson(Map<String, dynamic> json) =>
      _$MatchTeamInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MatchTeamInfoToJson(this);
}
