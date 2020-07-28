class Result {
  final bool winByInnings;
  final bool winByRuns;
  final String winningTeam;

  Result({
    this.winByInnings,
    this.winByRuns,
    this.winningTeam,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      winByInnings: json['winByInnings'],
      winByRuns: json['winByRuns'],
      winningTeam: json['winningTeam'],
    );
  }
}
