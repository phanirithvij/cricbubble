class TossResults {
  final String decision;
  final num tossWinnerId;
  final String tossWinnerName;

  TossResults({
    this.decision,
    this.tossWinnerId,
    this.tossWinnerName,
  });

  factory TossResults.fromJson(Map<String, dynamic> json) {
    return TossResults(
      decision: json['decision'],
      tossWinnerId: json['tossWinnerId'],
      tossWinnerName: json['tossWinnerName'],
    );
  }
}
