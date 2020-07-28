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

  factory CommentarySnippet.fromJson(Map<String, dynamic> json) {
    return CommentarySnippet(
      commId: json['commId'],
      content: json['content'],
      headline: json['headline'],
      infraType: json['infraType'],
      inningsId: json['inningsId'],
      isLive: json['isLive'],
      matchId: json['matchId'],
      parsedContent: json['parsedContent'],
      timestamp: json['timestamp'],
    );
  }
}
