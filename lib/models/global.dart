import 'package:cricbubble/models/commentary.dart';
import 'package:cricbubble/models/commentarySnippet.dart';
import 'package:cricbubble/models/matchHeader.dart';
import 'package:cricbubble/models/matchScore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'global.g.dart';

@JsonSerializable(nullable: false)
class GlobalDataModel {
  /* TODO see if types error out */
  final List<Commentary> commentaryList;
  final List<CommentarySnippet> commentarySnippetList;
  final bool enableNoContent;
  final MatchHeader matchHeader;
  final MiniScore miniscore;
  final String page;

  GlobalDataModel({
    this.commentaryList,
    this.commentarySnippetList,
    this.enableNoContent,
    this.matchHeader,
    this.miniscore,
    this.page,
  });

  factory GlobalDataModel.fromJson(Map<String, dynamic> json) =>
      _$GlobalDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalDataModelToJson(this);

  @override
  String toString() {
    return "$commentaryList";
  }
}
