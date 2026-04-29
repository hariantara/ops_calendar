// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarConfigImpl _$$CalendarConfigImplFromJson(Map<String, dynamic> json) =>
    _$CalendarConfigImpl(
      firstDayOfWeek:
          (json['firstDayOfWeek'] as num?)?.toInt() ?? DateTime.monday,
      maxVisibleLanes: (json['maxVisibleLanes'] as num?)?.toInt() ?? 3,
      showWeekdayLabels: json['showWeekdayLabels'] as bool? ?? true,
      locale: json['locale'] as String?,
    );

Map<String, dynamic> _$$CalendarConfigImplToJson(
        _$CalendarConfigImpl instance) =>
    <String, dynamic>{
      'firstDayOfWeek': instance.firstDayOfWeek,
      'maxVisibleLanes': instance.maxVisibleLanes,
      'showWeekdayLabels': instance.showWeekdayLabels,
      'locale': instance.locale,
    };
