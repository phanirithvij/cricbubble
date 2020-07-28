class BowlerStrike {
  final double bowlEcon;
  final num bowlId;
  final int bowlMaidens;
  final String bowlName;
  final int bowlNoballs;
  final int bowlOvs;
  final int bowlRuns;
  final int bowlWides;
  final int bowlWkts;

  BowlerStrike({
    this.bowlEcon,
    this.bowlId,
    this.bowlMaidens,
    this.bowlName,
    this.bowlNoballs,
    this.bowlOvs,
    this.bowlRuns,
    this.bowlWides,
    this.bowlWkts,
  });

  factory BowlerStrike.fromJson(Map<String, dynamic> json) {
    return BowlerStrike(
      bowlEcon: json['bowlEcon'],
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
