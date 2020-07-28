import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable(nullable: false)
class Team {
  final num id;
  final String name;
  //TODO
  final List playerDetails;
  final String shortName;

  Team({
    this.id,
    this.name,
    this.playerDetails,
    this.shortName,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
