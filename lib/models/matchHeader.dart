import 'package:cricbubble/models/matchteam.dart';
import 'package:cricbubble/models/result.dart';
import 'package:cricbubble/models/team.dart';
import 'package:cricbubble/models/toss.dart';
import 'package:json_annotation/json_annotation.dart';

part 'matchHeader.g.dart';

@JsonSerializable(nullable: false)
class MatchHeader {
  final bool complete;
  final bool dayNight;
  final int dayNumber;
  final bool domestic;
  final bool isMatchNotCovered;
  final num matchCompleteTimestamp;
  final String matchDescription;
  final String matchFormat;
  final int matchId;
  // TODO timestamps verify later(int/not)
  final num matchStartTimestamp;
  final List<MatchTeamInfo> matchTeamInfo;
  final String matchType;
  final List<MatchPlayer> playersOfTheMatch;
  final List<SeriesPlayer> playersOfTheSeries;
  final Result result;
  final RevisedTarget revisedTarget;
  final String seriesDesc;
  final String state;
  final String status;
  final Team team1;
  final Team team2;
  final TossResults tossResults;
  final int year;

  MatchHeader({
    this.complete,
    this.dayNight,
    this.dayNumber,
    this.domestic,
    this.isMatchNotCovered,
    this.matchCompleteTimestamp,
    this.matchDescription,
    this.matchFormat,
    this.matchId,
    this.matchStartTimestamp,
    this.matchTeamInfo,
    this.matchType,
    this.playersOfTheMatch,
    this.playersOfTheSeries,
    this.result,
    this.revisedTarget,
    this.seriesDesc,
    this.state,
    this.status,
    this.team1,
    this.team2,
    this.tossResults,
    this.year,
  });

  factory MatchHeader.fromJson(Map<String, dynamic> json) =>
      _$MatchHeaderFromJson(json);
  Map<String, dynamic> toJson() => _$MatchHeaderToJson(this);
}

@JsonSerializable(nullable: true)
class RevisedTarget {
  String reason;

  RevisedTarget({
    this.reason,
  });

  factory RevisedTarget.fromJson(Map<String, dynamic> json) =>
      _$RevisedTargetFromJson(json);
  Map<String, dynamic> toJson() => _$RevisedTargetToJson(this);
}

@JsonSerializable(nullable: true)
class MatchPlayer {
  final bool captain;
  final num faceImageId;
  final String fullName;
  final num id;
  final bool keeper;
  final String name;
  final String nickName;
  final bool substitute;
  final String teamName;

  MatchPlayer({
    this.captain,
    this.faceImageId,
    this.fullName,
    this.id,
    this.keeper,
    this.name,
    this.nickName,
    this.substitute,
    this.teamName,
  });

  factory MatchPlayer.fromJson(Map<String, dynamic> json) =>
      _$MatchPlayerFromJson(json);
  Map<String, dynamic> toJson() => _$MatchPlayerToJson(this);
}

@JsonSerializable(nullable: true)
class SeriesPlayer {
  final String battingStyle;
  final String bowlingStyle;
  final bool captain;
  final num faceImageId;
  final String fullName;
  final num id;
  final bool keeper;
  final String name;
  final String nickName;
  final String role;
  final num teamId;
  final String teamName;

  SeriesPlayer({
    this.fullName,
    this.id,
    this.keeper,
    this.name,
    this.nickName,
    this.role,
    this.teamId,
    this.teamName,
    this.battingStyle,
    this.bowlingStyle,
    this.captain,
    this.faceImageId,
  });

  factory SeriesPlayer.fromJson(Map<String, dynamic> json) =>
      _$SeriesPlayerFromJson(json);
  Map<String, dynamic> toJson() => _$SeriesPlayerToJson(this);
}
