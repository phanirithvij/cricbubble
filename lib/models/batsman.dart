class Batsman {
  final int batBalls;
  final int batFours;
  final int batId;
  final String batName;
  final int batRuns;
  final int batSixes;
  final double batStrikeRate;

  Batsman({
    this.batBalls,
    this.batFours,
    this.batId,
    this.batName,
    this.batRuns,
    this.batSixes,
    this.batStrikeRate,
  });

  factory Batsman.fromJson(Map<String, dynamic> json) {
    return Batsman(
      batBalls: json['batBalls'],
      batFours: json['batFours'],
      batId: json['batId'],
      batName: json['batName'],
      batRuns: json['batRuns'],
      batSixes: json['batSixes'],
      batStrikeRate: json['batStrikeRate'],
    );
  }
}
