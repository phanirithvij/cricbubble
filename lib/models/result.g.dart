// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    winByInnings: json['winByInnings'] as bool,
    winByRuns: json['winByRuns'] as bool,
    winningTeam: json['winningTeam'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'winByInnings': instance.winByInnings,
      'winByRuns': instance.winByRuns,
      'winningTeam': instance.winningTeam,
    };
