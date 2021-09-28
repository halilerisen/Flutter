import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  bool isChecked = false;
  final Function(bool? checkboxState) checkBoxCallback;
  final Function() onLongPressCallback;

  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkBoxCallback,
    required this.onLongPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      leading: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}

// (bool? checkBoxState) {
// setState(() {
// isChecked = checkBoxState!;
// });
// }
