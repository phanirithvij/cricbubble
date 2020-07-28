import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(nullable: false)
class Result {
  final bool winByInnings;
  final bool winByRuns;
  final String winningTeam;

  Result({
    this.winByInnings,
    this.winByRuns,
    this.winningTeam,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
