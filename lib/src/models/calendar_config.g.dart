// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarConfig _$CalendarConfigFromJson(Map<String, dynamic> json) =>
    _CalendarConfig(
      firstDayOfWeek:
          (json['firstDayOfWeek'] as num?)?.toInt() ?? DateTime.monday,
      maxVisibleLanes: (json['maxVisibleLanes'] as num?)?.toInt() ?? 3,
      showWeekdayLabels: json['showWeekdayLabels'] as bool? ?? true,
      locale: json['locale'] as String?,
    );

Map<String, dynamic> _$CalendarConfigToJson(_CalendarConfig instance) =>
    <String, dynamic>{
      'firstDayOfWeek': instance.firstDayOfWeek,
      'maxVisibleLanes': instance.maxVisibleLanes,
      'showWeekdayLabels': instance.showWeekdayLabels,
      'locale': instance.locale,
    };
