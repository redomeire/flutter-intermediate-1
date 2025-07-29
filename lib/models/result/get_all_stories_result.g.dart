// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_stories_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetAllStoriesResult _$GetAllStoriesResultFromJson(Map<String, dynamic> json) =>
    _GetAllStoriesResult(
      error: json['error'] as bool,
      message: json['message'] as String,
      listStory: (json['listStory'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllStoriesResultToJson(
  _GetAllStoriesResult instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'listStory': instance.listStory,
};
