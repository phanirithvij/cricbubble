import 'package:json_annotation/json_annotation.dart';

part 'toss.g.dart';

@JsonSerializable(nullable: false)
class TossResults {
  final String decision;
  final num tossWinnerId;
  final String tossWinnerName;

  TossResults({
    this.decision,
    this.tossWinnerId,
    this.tossWinnerName,
  });

  factory TossResults.fromJson(Map<String, dynamic> json) =>
      _$TossResultsFromJson(json);
  Map<String, dynamic> toJson() => _$TossResultsToJson(this);
}
