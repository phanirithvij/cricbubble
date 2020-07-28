class LatestPerformance {
  final String label;
  final int runs;
  final int wkts;

  LatestPerformance({
    this.label,
    this.runs,
    this.wkts,
  });

  factory LatestPerformance.fromJson(Map<String, dynamic> json) {
    return LatestPerformance(
      label: json['label'],
      runs: json['runs'],
      wkts: json['wkts'],
    );
  }
}
