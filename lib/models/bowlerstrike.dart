import 'package:json_annotation/json_annotation.dart';

part 'bowlerstrike.g.dart';

@JsonSerializable(nullable: true)
class BowlerStrike {
  final double bowlEcon;
  final num bowlId;
  final int bowlMaidens;
  final String bowlName;
  final int bowlNoballs;
  final double bowlOvs;
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

  factory BowlerStrike.fromJson(Map<String, dynamic> json) =>
      _$BowlerStrikeFromJson(json);
  Map<String, dynamic> toJson() => _$BowlerStrikeToJson(this);
}
