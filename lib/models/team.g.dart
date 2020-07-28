// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
    id: json['id'] as num,
    name: json['name'] as String,
    playerDetails: json['playerDetails'] as List,
    shortName: json['shortName'] as String,
  );
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'playerDetails': instance.playerDetails,
      'shortName': instance.shortName,
    };
