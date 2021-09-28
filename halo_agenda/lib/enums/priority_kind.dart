import 'package:flutter/material.dart';

enum PriorityKind { low, medium, high }

class PriorityKindClass {
  static const Map<PriorityKind, String> _priorityKindNameList = {
    PriorityKind.low: 'low-priority',
    PriorityKind.medium: 'medium-priority',
    PriorityKind.high: 'high-priority',
  };

  static const Map<PriorityKind, MaterialColor> _priorityKindColorList = {
    PriorityKind.low: Colors.yellow,
    PriorityKind.medium: Colors.blue,
    PriorityKind.high: Colors.red,
  };

  static Map<PriorityKind, MaterialColor> get priorityKindColorList =>
      Map.unmodifiable(_priorityKindColorList);

  static Map<PriorityKind, String> get priorityKindNameList =>
      Map.unmodifiable(_priorityKindNameList);

  static getNameKey(String value) {
    if (value == null) return null;
    return _priorityKindNameList.keys
        .firstWhere((element) => _priorityKindNameList[element] == value);
  }
}
