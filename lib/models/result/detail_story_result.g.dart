// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_story_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailStoryResult _$DetailStoryResultFromJson(Map<String, dynamic> json) =>
    _DetailStoryResult(
      error: json['error'] as bool,
      message: json['message'] as String,
      story: Story.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailStoryResultToJson(_DetailStoryResult instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.story,
    };
