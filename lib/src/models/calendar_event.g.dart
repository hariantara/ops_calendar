// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventImpl _$$CalendarEventImplFromJson(Map<String, dynamic> json) =>
    _$CalendarEventImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      color: json['color'] == null
          ? const Color(0xFF3B82F6)
          : const ColorConverter().fromJson((json['color'] as num).toInt()),
      subtitle: json['subtitle'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CalendarEventImplToJson(_$CalendarEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'color': const ColorConverter().toJson(instance.color),
      'subtitle': instance.subtitle,
      'metadata': instance.metadata,
    };
