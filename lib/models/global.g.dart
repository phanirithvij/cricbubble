// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalDataModel _$GlobalDataModelFromJson(Map<String, dynamic> json) {
  return GlobalDataModel(
    commentaryList: (json['commentaryList'] as List)
        .map((e) => Commentary.fromJson(e as Map<String, dynamic>))
        .toList(),
    commentarySnippetList: (json['commentarySnippetList'] as List)
        .map((e) => CommentarySnippet.fromJson(e as Map<String, dynamic>))
        .toList(),
    enableNoContent: json['enableNoContent'] as bool,
    matchHeader:
        MatchHeader.fromJson(json['matchHeader'] as Map<String, dynamic>),
    miniscore: MiniScore.fromJson(json['miniscore'] as Map<String, dynamic>),
    page: json['page'] as String,
  );
}

Map<String, dynamic> _$GlobalDataModelToJson(GlobalDataModel instance) =>
    <String, dynamic>{
      'commentaryList': instance.commentaryList,
      'commentarySnippetList': instance.commentarySnippetList,
      'enableNoContent': instance.enableNoContent,
      'matchHeader': instance.matchHeader,
      'miniscore': instance.miniscore,
      'page': instance.page,
    };
