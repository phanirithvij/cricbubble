// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentarySnippet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentarySnippet _$CommentarySnippetFromJson(Map<String, dynamic> json) {
  return CommentarySnippet(
    commId: json['commId'] as num,
    content: json['content'] as String,
    headline: json['headline'] as String,
    infraType: json['infraType'] as String,
    inningsId: json['inningsId'] as num,
    isLive: json['isLive'] as bool,
    matchId: json['matchId'] as num,
    parsedContent: json['parsedContent'] as List,
    timestamp: json['timestamp'] as num,
  );
}

Map<String, dynamic> _$CommentarySnippetToJson(CommentarySnippet instance) =>
    <String, dynamic>{
      'commId': instance.commId,
      'content': instance.content,
      'headline': instance.headline,
      'infraType': instance.infraType,
      'inningsId': instance.inningsId,
      'isLive': instance.isLive,
      'matchId': instance.matchId,
      'parsedContent': instance.parsedContent,
      'timestamp': instance.timestamp,
    };
