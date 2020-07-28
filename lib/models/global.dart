import 'package:cricbubble/models/commentary.dart';
import 'package:cricbubble/models/commentarySnippet.dart';
import 'package:cricbubble/models/matchHeader.dart';
import 'package:cricbubble/models/matchScore.dart';

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

  factory GlobalDataModel.fromJson(Map<String, dynamic> json) {
    return GlobalDataModel(
      commentaryList: (json['commentaryList'] as List)
          .map((dynamic x) => Commentary.fromJson(x))
          .toList(),
      commentarySnippetList: (json['commentarySnippetList'] as List)
          .map((dynamic x) => CommentarySnippet.fromJson(x))
          .toList(),
      enableNoContent: json['enableNoContent'],
      matchHeader: MatchHeader.fromJson(json['matchHeader']),
      miniscore: MiniScore.fromJson(json['miniscore']),
      page: json['page'],
    );
  }
}
