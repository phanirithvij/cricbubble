import 'package:json_annotation/json_annotation.dart';

part 'batsmanstrike.g.dart';

@JsonSerializable(nullable: true)
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

  factory BatsmanStrike.fromJson(Map<String, dynamic> json) =>
      _$BatsmanStrikeFromJson(json);
  Map<String, dynamic> toJson() => _$BatsmanStrikeToJson(this);
}
