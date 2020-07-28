import 'package:cricbubble/models/commentary.dart';
import 'package:cricbubble/models/commentarySnippet.dart';
import 'package:cricbubble/models/matchHeader.dart';
import 'package:cricbubble/models/matchScore.dart';

class GlobalDataModel {
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
      commentaryList: json['commentaryList'],
      commentarySnippetList: json['commentarySnippetList'],
      enableNoContent: json['enableNoContent'],
      matchHeader: json['matchHeader'],
      miniscore: json['miniscore'],
      page: json['page'],
    );
  }
}
