import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

import '../widgets/task_tile.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Consumer<DataModel> dikkat..!!
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];

            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallback: (bool? checkboxState) {
                taskData.updateTask(task);
              },
              onLongPressCallback: () {
                context.read<TaskData>().removeTask(task);
              },
            );
          },
        );
      },
    );
  }
}
