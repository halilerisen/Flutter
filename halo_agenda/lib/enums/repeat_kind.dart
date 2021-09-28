import 'package:flutter/cupertino.dart';

import '../constans.dart';

enum RepeatKind { oneTime, untilDate, count }

class RepeatKindClass {
  static const Map<RepeatKind, String> _repeatKindNameList = {
    RepeatKind.oneTime: 'One Time',
    RepeatKind.count: 'Repeat',
    RepeatKind.untilDate: 'Until Date',
  };

  static const Map<RepeatKind, Icon> _repeatKindIcon12List = {
    RepeatKind.oneTime: kTaskRepeatOneIcon12,
    RepeatKind.untilDate: kTaskRepeatUntilDateIcon12,
    RepeatKind.count: kTaskRepetitionIcon12,
  };

  static const Map<RepeatKind, Icon> _repeatKindIcon24List = {
    RepeatKind.oneTime: kTaskRepeatOneIcon24,
    RepeatKind.untilDate: kTaskRepeatUntilDateIcon24,
    RepeatKind.count: kTaskRepetitionIcon24,
  };

  static Map<RepeatKind, Icon> get repeatKindIcon12List =>
      Map.unmodifiable(_repeatKindIcon12List);

  static Map<RepeatKind, Icon> get repeatKindIcon24List =>
      Map.unmodifiable(_repeatKindIcon24List);

  static Map<RepeatKind, String> get repeatKindNameList =>
      Map.unmodifiable(_repeatKindNameList);

  static RepeatKind getNameKey(String value) {
    if (value == null) return null;
    return _repeatKindNameList.keys
        .firstWhere((element) => _repeatKindNameList[element] == value);
  }
}
