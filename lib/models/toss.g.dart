// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TossResults _$TossResultsFromJson(Map<String, dynamic> json) {
  return TossResults(
    decision: json['decision'] as String,
    tossWinnerId: json['tossWinnerId'] as num,
    tossWinnerName: json['tossWinnerName'] as String,
  );
}

Map<String, dynamic> _$TossResultsToJson(TossResults instance) =>
    <String, dynamic>{
      'decision': instance.decision,
      'tossWinnerId': instance.tossWinnerId,
      'tossWinnerName': instance.tossWinnerName,
    };
