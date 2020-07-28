class BatsmanStrike {
  final int batBalls;
  final int batDots;
  final int batFours;
  final num batId;
  final int batMins;
  final String batName;
  final int batRuns;
  final int batSixes;
  final double batStrikeRate;

  BatsmanStrike({
    this.batBalls,
    this.batDots,
    this.batFours,
    this.batId,
    this.batMins,
    this.batName,
    this.batRuns,
    this.batSixes,
    this.batStrikeRate,
  });

  factory BatsmanStrike.fromJson(Map<String, dynamic> json) {
    return BatsmanStrike(
      batBalls: json['batBalls'],
      batDots: json['batDots'],
      batFours: json['batFours'],
      batId: json['batId'],
      batMins: json['batMins'],
      batName: json['batName'],
      batRuns: json['batRuns'],
      batSixes: json['batSixes'],
      batStrikeRate: json['batStrikeRate'],
    );
  }
}
