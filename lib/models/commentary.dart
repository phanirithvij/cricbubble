class Commentary {
  final int ballNbr;
  final String batTeamName;
  final Map<String, Object> batsmanStriker;
  final Map<String, Object> bowlerStriker;
  final String commText;
  final Map commentaryFormats;
  final String event;
  final int inningsId;
  final int timestamp;
  final Map overSeperator;

  Commentary(
      this.ballNbr,
      this.batTeamName,
      this.batsmanStriker,
      this.bowlerStriker,
      this.commText,
      this.commentaryFormats,
      this.event,
      this.inningsId,
      this.timestamp,
      this.overSeperator);
}
