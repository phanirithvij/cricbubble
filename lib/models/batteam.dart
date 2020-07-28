class BatTeam {
  final num teamId;
  final int teamScore;
  final int teamWkts;

  BatTeam({
    this.teamId,
    this.teamScore,
    this.teamWkts,
  });

  factory BatTeam.fromJson(Map<String, dynamic> json) {
    return BatTeam(
      teamId: json['teamId'],
      teamScore: json['teamScore'],
      teamWkts: json['teamWkts'],
    );
  }
}
