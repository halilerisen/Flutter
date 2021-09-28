import 'package:flutter/material.dart';
import 'package:haloagenda/models/tasks_brain.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../enums/repeat_kind.dart';
import '../models/task.dart';
import '../widgets/custom_priority_container.dart';
import '../widgets/todo_edit_popup.dart';

class TodoTile extends StatelessWidget {
  final Task task;

  TodoTile({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: GestureDetector(
        onTap: () async {
          return showDialog<void>(
              context: context,
              builder: (context) {
                return TodoEditPopup(
                  task: task,
                );
              });
        },
        onDoubleTap: () {
          Provider.of<TaskBrain>(context, listen: false).isMarkOutToogle(task);
        },
        onLongPress: () {
          bool res =
              Provider.of<TaskBrain>(context, listen: false).isDoneToogle(task);
          if (res) {
            Provider.of<TaskBrain>(context, listen: false)
              ..removeTaskWithoutDB(task)
              ..addTaskWithoutDB(task);
          } else {
            Provider.of<TaskBrain>(context, listen: false)
              ..removeTaskWithoutDB(task)
              ..insertTaskWithoutDB(0, task);
          }
        },
        child: Container(
          color: kAppPrimaryColor,
          height: 50.0,
          child: Row(
            children: <Widget>[
              CustomPriorityContainer(
                height: 10.0,
                width: 10.0,
                offset: 0,
                priorityKind: task.priority,
                priorityKindTemp: task.priority,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      task.name,
                      style: kTodoTitleTextStyle.copyWith(
                        decoration: (task.isDone || task.isMarkOut)
                            ? TextDecoration.lineThrough
                            : null,
                        decorationColor: task.isDone
                            ? Color(0xAAFFFFFF)
                            : task.isMarkOut ? Color(0xAA00FF09) : null,
                        decorationThickness:
                            (task.isDone || task.isMarkOut) ? 7.0 : null,
                      ),
                    ),
                    Text(
                      task.description ?? '',
                      style: kTodoDescriptionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.0, left: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (task.date != null)
                        ? kTaskAlertIcon
                        : SizedBox(width: 12.0, height: 12.0),
                    RepeatKindClass.repeatKindIcon12List[task.repeatKind] ??
                        SizedBox(width: 12.0, height: 12.0),
                  ],
                ),
              ),
              Handle(
                delay: const Duration(milliseconds: 10),
                vibrate: true,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: kDragHandleIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
