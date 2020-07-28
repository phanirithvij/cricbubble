class Bowler {
  final int bowlId;
  final int bowlMaidens;
  final String bowlName;
  final int bowlNoballs;
  final int bowlOvs;
  final int bowlRuns;
  final int bowlWides;
  final int bowlWkts;

  Bowler({
    this.bowlId,
    this.bowlMaidens,
    this.bowlName,
    this.bowlNoballs,
    this.bowlOvs,
    this.bowlRuns,
    this.bowlWides,
    this.bowlWkts,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) {
    return Bowler(
      bowlId: json['bowlId'],
      bowlMaidens: json['bowlMaidens'],
      bowlName: json['bowlName'],
      bowlNoballs: json['bowlNoballs'],
      bowlOvs: json['bowlOvs'],
      bowlRuns: json['bowlRuns'],
      bowlWides: json['bowlWides'],
      bowlWkts: json['bowlWkts'],
    );
  }
}
