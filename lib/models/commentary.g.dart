// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commentary _$CommentaryFromJson(Map<String, dynamic> json) {
  return Commentary(
    ballNbr: json['ballNbr'] as int,
    batTeamName: json['batTeamName'] as String,
    batsmanStriker:
        BatsmanStrike.fromJson(json['batsmanStriker'] as Map<String, dynamic>),
    bowlerStriker:
        BowlerStrike.fromJson(json['bowlerStriker'] as Map<String, dynamic>),
    commText: json['commText'] as String,
    commentaryFormats: json['commentaryFormats'] as Map<String, dynamic>,
    event: json['event'] as String,
    inningsId: json['inningsId'] as int,
    timestamp: json['timestamp'] as int,
    overSeperator: json['overSeperator'] == null
        ? null
        : OverSeparator.fromJson(json['overSeperator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentaryToJson(Commentary instance) =>
    <String, dynamic>{
      'ballNbr': instance.ballNbr,
      'batTeamName': instance.batTeamName,
      'batsmanStriker': instance.batsmanStriker,
      'bowlerStriker': instance.bowlerStriker,
      'commText': instance.commText,
      'commentaryFormats': instance.commentaryFormats,
      'event': instance.event,
      'inningsId': instance.inningsId,
      'timestamp': instance.timestamp,
      'overSeperator': instance.overSeperator,
    };
