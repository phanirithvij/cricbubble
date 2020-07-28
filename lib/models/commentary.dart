import 'package:cricbubble/models/batsmanstrike.dart';
import 'package:cricbubble/models/bowlerstrike.dart';
import 'package:cricbubble/models/oversep.dart';

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

  factory Commentary.fromJson(Map<String, dynamic> json) {
    return Commentary(
      ballNbr: json['ballNbr'],
      batTeamName: json['batTeamName'],
      batsmanStriker: json['batsmanStriker'] != null
          ? BatsmanStrike.fromJson(json['batsmanStriker'])
          : null,
      bowlerStriker: json['bowlerStriker'] != null
          ? BowlerStrike.fromJson(json['bowlerStriker'])
          : null,
      commText: json['commText'],
      commentaryFormats: json['commentaryFormats'],
      event: json['event'],
      inningsId: json['inningsId'],
      timestamp: json['timestamp'],
      overSeperator: (json['overSeperator'] != null)
          ? OverSeparator.fromJson(json['overSeperator'])
          : null,
    );
  }
}
