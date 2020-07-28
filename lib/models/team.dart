class Team {
  final num id;
  final String name;
  //TODO
  final List playerDetails;
  final String shortName;

  Team({
    this.id,
    this.name,
    this.playerDetails,
    this.shortName,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      playerDetails: json['playerDetails'],
      shortName: json['shortName'],
    );
  }
}
