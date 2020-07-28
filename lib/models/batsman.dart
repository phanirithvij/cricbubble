import 'package:json_annotation/json_annotation.dart';

part 'batsman.g.dart';

@JsonSerializable(nullable: true)
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

  factory Batsman.fromJson(Map<String, dynamic> json) =>
      _$BatsmanFromJson(json);
  Map<String, dynamic> toJson() => _$BatsmanToJson(this);
}
