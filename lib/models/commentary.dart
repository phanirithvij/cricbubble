import 'package:cricbubble/models/batsmanstrike.dart';
import 'package:cricbubble/models/bowlerstrike.dart';
import 'package:cricbubble/models/oversep.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commentary.g.dart';

@JsonSerializable(nullable: false)
class Commentary {
  final int ballNbr;
  final String batTeamName;

  final BatsmanStrike batsmanStriker;
  final BowlerStrike bowlerStriker;

  final String commText;

  // TODO
  final Map commentaryFormats;
  final String event;
  final int inningsId;
  final int timestamp;
  @JsonKey(nullable: true)
  final OverSeparator overSeperator;

  Commentary({
    this.ballNbr,
    this.batTeamName,
    this.batsmanStriker,
    this.bowlerStriker,
    this.commText,
    this.commentaryFormats,
    this.event,
    this.inningsId,
    this.timestamp,
    this.overSeperator,
  });

  factory Commentary.fromJson(Map<String, dynamic> json) =>
      _$CommentaryFromJson(json);
  Map<String, dynamic> toJson() => _$CommentaryToJson(this);

  @override
  String toString() {
    return commText;
  }
}
