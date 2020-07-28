import 'package:cricbubble/models/matchteam.dart';
import 'package:cricbubble/models/result.dart';
import 'package:cricbubble/models/team.dart';
import 'package:cricbubble/models/toss.dart';

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
  final List<String> playersOfTheMatch;
  final List<String> playersOfTheSeries;
  final Result result;
  final Map<String, String> revisedTarget;
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

  factory MatchHeader.fromJson(Map<String, dynamic> json) {
    return MatchHeader(
      complete: json['complete'],
      dayNight: json['dayNight'],
      dayNumber: json['dayNumber'],
      domestic: json['domestic'],
      isMatchNotCovered: json['isMatchNotCovered'],
      matchCompleteTimestamp: json['matchCompleteTimestamp'],
      matchDescription: json['matchDescription'],
      matchFormat: json['matchFormat'],
      matchId: json['matchId'],
      matchStartTimestamp: json['matchStartTimestamp'],
      matchTeamInfo: json['matchTeamInfo'],
      matchType: json['matchType'],
      playersOfTheMatch: json['playersOfTheMatch'],
      playersOfTheSeries: json['playersOfTheSeries'],
      result: json['result'],
      revisedTarget: json['revisedTarget'],
      seriesDesc: json['seriesDesc'],
      state: json['state'],
      status: json['status'],
      team1: json['team1'],
      team2: json['team2'],
      tossResults: json['tossResults'],
      year: json['year'],
    );
  }
}
