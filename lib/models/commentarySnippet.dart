import 'package:json_annotation/json_annotation.dart';

part 'commentarySnippet.g.dart';

@JsonSerializable(nullable: true)
class CommentarySnippet {
  final num commId;
  final String content;
  final String headline;
  final String infraType;
  final num inningsId;
  final bool isLive;
  final num matchId;
  // TODO(type unknown)
  final List parsedContent;
  final num timestamp;

  CommentarySnippet({
    this.commId,
    this.content,
    this.headline,
    this.infraType,
    this.inningsId,
    this.isLive,
    this.matchId,
    this.parsedContent,
    this.timestamp,
  });

  factory CommentarySnippet.fromJson(Map<String, dynamic> json) =>
      _$CommentarySnippetFromJson(json);
  Map<String, dynamic> toJson() => _$CommentarySnippetToJson(this);
}
