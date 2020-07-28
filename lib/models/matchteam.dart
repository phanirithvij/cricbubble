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

  factory MatchTeamInfo.fromJson(Map<String, dynamic> json) {
    return MatchTeamInfo(
      battingTeamId: json['battingTeamId'],
      battingTeamShortName: json['battingTeamShortName'],
      bowlingTeamId: json['bowlingTeamId'],
      bowlingTeamShortName: json['bowlingTeamShortName'],
    );
  }
}
