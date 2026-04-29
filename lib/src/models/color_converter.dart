import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// Serializes [Color] as a 32-bit ARGB integer for JSON.
///
/// Uses the Flutter 3.27+ component-based API (`color.a`, `color.r`, ...)
/// to avoid the deprecated `Color.value` getter.
class ColorConverter implements JsonConverter<Color, int> {
  /// Creates a const [ColorConverter].
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) {
    final a = (color.a * 255).round() & 0xff;
    final r = (color.r * 255).round() & 0xff;
    final g = (color.g * 255).round() & 0xff;
    final b = (color.b * 255).round() & 0xff;
    return (a << 24) | (r << 16) | (g << 8) | b;
  }
}
