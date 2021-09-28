import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../models/group.dart';
import '../models/task.dart';
import '../models/tasks_brain.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/todo_tile.dart';

class TodoScreen extends StatefulWidget {
  static const id = 'todo_screen';
  final Group group;

  TodoScreen({@required this.group});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final addTaskTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<TaskBrain>(context, listen: false)
        .dbOperations
        .createTasksTable();
    tasks;
  }

  get tasks async {
    await Provider.of<TaskBrain>(context, listen: false)
        .getTasksFromDatabase(widget.group.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2096BA),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            //TODO :Iconu sonra değiştir..
            icon: Icon(Icons.settings),
            onPressed: null,
          )
        ],
        title: Text(
          widget.group.name,
          style: kGroupTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ImplicitlyAnimatedReorderableList<Task>(
              areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
              items: Provider.of<TaskBrain>(context).tasks,
              onReorderFinished: (item, from, to, allList) {
                Provider.of<TaskBrain>(context, listen: false)
                  ..removeTaskWithoutDB(item)
                  ..insertTaskWithoutDB(to, item);
              },
              itemBuilder: (context, itemAnimation, item, index) {
                return Reorderable(
                  key: ValueKey(item),
                  builder: (context, dragAnimation, inDrag) {
                    final t = dragAnimation.value;
                    final color = Color.lerp(
                        Colors.white, Colors.white.withOpacity(0.8), t);

                    return SizeFadeTransition(
                      sizeFraction: 0.7,
                      curve: Curves.slowMiddle,
                      animation: itemAnimation,
                      child: Material(
                        color: color,
                        type: MaterialType.transparency,
                        child: TodoTile(
                          task: item,
                        ),
                      ),
                    );
                  },
                );
              },
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    color: kTodoPrimaryColor,
                    child: Image.asset(
                      'images/todoBackground.png',
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Tasks : '
                            '${Provider.of<TaskBrain>(context).tasksDoneCount}/'
                            '${Provider.of<TaskBrain>(context).tasksCount}',
                            style: kShoppingPriceTextStyle.copyWith(
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              scrollDirection: Axis.vertical,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomTextField(
              hintText: 'Enter Task...',
              prefixIcon: kTodoGroupIcon,
              suffixIcon: kAppAddIcon,
              maxLength: 40,
              messageTextController: addTaskTextController,
              addOnPressedFunction: () {
                if (addTaskTextController.text.length <= 0) return;
                FocusScope.of(context).unfocus();

                Provider.of<TaskBrain>(context, listen: false).insertTaskWithDB(
                    0,
                    Task(
                      name: addTaskTextController.text,
                      groupId: widget.group.id,
                    ));

                addTaskTextController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
