import 'package:json_annotation/json_annotation.dart';

part 'bowler.g.dart';

@JsonSerializable(nullable: true)
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

  factory Bowler.fromJson(Map<String, dynamic> json) => _$BowlerFromJson(json);
  Map<String, dynamic> toJson() => _$BowlerToJson(this);
}
