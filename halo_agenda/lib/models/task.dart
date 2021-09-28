import 'package:haloagenda/enums/priority_kind.dart';
import 'package:haloagenda/enums/repeat_kind.dart';

class Task {
  final int id;
  final int nextId;
  final int groupId;
  int indexNumber;
  String name;
  String description;
  RepeatKind repeatKind;
  int repeatDistance;
  DateTime date;
  int repeatCount;
  PriorityKind priority;
  bool isDone;
  bool isMarkOut;

  Task({
    this.id,
    this.name,
    this.description,
    this.date,
    this.nextId,
    this.indexNumber,
    this.groupId,
    this.repeatKind = RepeatKind.oneTime,
    this.repeatDistance = 1,
    this.repeatCount = 1,
    this.priority = PriorityKind.low,
    this.isDone = false,
    this.isMarkOut = false,
  });

  bool toggleIsDone() {
    isDone = !isDone;
    return isDone;
  }

  bool toggleIsMarkOut() {
    isMarkOut = !isMarkOut;
    return isMarkOut;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date.toString(),
      'nextId': nextId,
      'indexNumber': indexNumber,
      'groupId': groupId,
      'repeatKind': RepeatKindClass.repeatKindNameList[repeatKind],
      'repeatDistance': repeatDistance,
      'repeatCount': repeatCount,
      'priority': PriorityKindClass.priorityKindNameList[priority],
      'isDone': isDone ? 1 : 0,
      'isMarkOut': isMarkOut ? 1 : 0,
    };
  }
}
