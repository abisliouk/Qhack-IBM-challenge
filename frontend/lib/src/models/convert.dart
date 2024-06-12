import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:enum_to_string/enum_to_string.dart';

int? toInt(dynamic input) {
  if (input == null) return null;
  if (input is num) {
    return input.toInt();
  } else if (input is String) {
    return int.parse(input);
  }
  throw ArgumentError("Cannot parse as int: ${input.runtimeType}");
}

BigInt toBigInt(dynamic input) {
  return toBigIntOrNull(input) ?? BigInt.zero;
}

BigInt? toBigIntOrNull(dynamic input) {
  if (input == null) return null;
  if (input is num) {
    return BigInt.from(input);
  }
  return BigInt.tryParse(input ?? '');
}

double? toDouble(dynamic input) {
  if (input == null) return null;
  if (input is num) {
    return input.toDouble();
  } else if (input is String) {
    return double.parse(input);
  }
  throw ArgumentError("Cannot parse as double: ${input.runtimeType}");
}

DateTime? toDateTime(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  return DateTime.parse(value);
}

String? dayAsString(DateTime? date) {
  if (date == null) {
    return null;
  }
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  return dateFormatter.format(date);
}

String? timeAsString(TimeOfDay? time) {
  if (time == null) {
    return null;
  }

  String _addLeadingZeroIfNeeded(int value) {
    return value < 10 ? '0$value' : value.toString();
  }

  final String hourLabel = _addLeadingZeroIfNeeded(time.hour);
  final String minuteLabel = _addLeadingZeroIfNeeded(time.minute);

  return '$hourLabel:$minuteLabel';
}

List<String>? toListString(List<dynamic>? list) {
  if (list == null) {
    return null;
  }
  return list.map((e) => e as String).toList();
}

T? toEnum<T>(List<T> enumValues, String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  return EnumToString.fromString(enumValues, value);
}
