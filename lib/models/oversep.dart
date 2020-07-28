class OverSeparator {
  final int batNonStrikerBalls;
  final List<int> batNonStrikerIds;
  final List<String> batNonStrikerNames;
  final int batNonStrikerRuns;
  final int batStrikerBalls;
  final List<int> batStrikerIds;
  final List<String> batStrikerNames;
  final int batStrikerRuns;
  final String batTeamName;
  final int bowlIds;
  final int bowlMaidens;
  final List<String> bowlNames;
  final int bowlOvers;
  final int bowlRuns;
  final int bowlWickets;
  final String event;
  final int inningsId;
  // json o_summary
  final String overSummary;
  final double overNum;
  final int runs;
  final int score;
  final int timestamp;
  final int wickets;

  OverSeparator({
    this.batNonStrikerBalls,
    this.batNonStrikerIds,
    this.batNonStrikerNames,
    this.batNonStrikerRuns,
    this.batStrikerBalls,
    this.batStrikerIds,
    this.batStrikerNames,
    this.batStrikerRuns,
    this.batTeamName,
    this.bowlIds,
    this.bowlMaidens,
    this.bowlNames,
    this.bowlOvers,
    this.bowlRuns,
    this.bowlWickets,
    this.event,
    this.inningsId,
    this.overSummary,
    this.overNum,
    this.runs,
    this.score,
    this.timestamp,
    this.wickets,
  });

  factory OverSeparator.fromJson(Map<String, dynamic> json) {
    return OverSeparator(
      batNonStrikerBalls: json['batNonStrikerBalls'],
      batNonStrikerIds: json['batNonStrikerIds'],
      batNonStrikerNames: json['batNonStrikerNames'],
      batNonStrikerRuns: json['batNonStrikerRuns'],
      batStrikerBalls: json['batStrikerBalls'],
      batStrikerIds: json['batStrikerIds'],
      batStrikerNames: json['batStrikerNames'],
      batStrikerRuns: json['batStrikerRuns'],
      batTeamName: json['batTeamName'],
      bowlIds: json['bowlIds'],
      bowlMaidens: json['bowlMaidens'],
      bowlNames: json['bowlNames'],
      bowlOvers: json['bowlOvers'],
      bowlRuns: json['bowlRuns'],
      bowlWickets: json['bowlWickets'],
      event: json['event'],
      inningsId: json['inningsId'],
      overSummary: json['o_summary'],
      overNum: json['overNum'],
      runs: json['runs'],
      score: json['score'],
      timestamp: json['timestamp'],
      wickets: json['wickets'],
    );
  }
}
