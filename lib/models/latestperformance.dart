import 'package:json_annotation/json_annotation.dart';

part 'latestperformance.g.dart';

@JsonSerializable(nullable: true)
class LatestPerformance {
  final String label;
  final int runs;
  final int wkts;

  LatestPerformance({
    this.label,
    this.runs,
    this.wkts,
  });

  factory LatestPerformance.fromJson(Map<String, dynamic> json) =>
      _$LatestPerformanceFromJson(json);
  Map<String, dynamic> toJson() => _$LatestPerformanceToJson(this);
}
