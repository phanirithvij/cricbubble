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
  factory InningsScore.fromJson(Map<String, dynamic> json) {
    return InningsScore(
      batTeamId: json['batTeamId'],
      batTeamName: json['batTeamName'],
      inningsId: json['inningsId'],
      isDeclared: json['isDeclared'],
      isFollowOn: json['isFollowOn'],
      overs: json['overs'],
      score: json['score'],
      wickets: json['wickets'],
    );
  }
}
