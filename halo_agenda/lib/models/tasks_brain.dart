import 'package:flutter/cupertino.dart';
import 'package:haloagenda/database/tasks_database.dart';

import 'task.dart';

class TaskBrain extends ChangeNotifier {
  final List<Task> _tasks = [];

  final TasksDatabase _dbOperations = TasksDatabase();

  List<Task> get tasks => List.unmodifiable(_tasks);

  TasksDatabase get dbOperations => _dbOperations;

  int get tasksDoneCount {
    int isDone = 0;
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].isDone || _tasks[i].isMarkOut) isDone++;
    }
    return isDone;
  }

  int get tasksCount => _tasks.length;

  Future<void> getTasksFromDatabase(int groupId) async {
    _tasks.clear();
    List<Task> shoppingItemsDB = await _dbOperations.getTasks(groupId);
    _tasks.addAll(shoppingItemsDB);
    notifyListeners();
  }

  void addTaskWithoutDB(Task task) {
    _tasks.add(task);
    _updateIndexs();
    notifyListeners();
  }

  void insertTaskWithoutDB(int index, Task task) {
    _tasks.insert(index, task);
    _updateIndexs();
    notifyListeners();
  }

  void insertTaskWithDB(int index, Task task) async {
    int id = await dbOperations.addTask(task);
    _tasks.insert(
        index,
        Task(
          id: id,
          name: task.name,
          nextId: task.nextId,
          repeatKind: task.repeatKind,
          repeatCount: task.repeatCount,
          repeatDistance: task.repeatDistance,
          isDone: task.isDone,
          isMarkOut: task.isMarkOut,
          groupId: task.groupId,
          indexNumber: task.indexNumber,
          priority: task.priority,
          date: task.date,
          description: task.description,
        ));
    _updateIndexs();
    notifyListeners();
  }

  void removeTaskWithoutDB(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void removeTaskWithDB(Task task) {
    dbOperations.removeTask(task);
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    dbOperations.updateTask(task);
    _tasks[_tasks.indexOf(task)] = task;
    notifyListeners();
//    dbOperations.updateTask(task);
  }

  bool isDoneToogle(Task task) {
    bool result = _tasks[_tasks.indexOf(task)].toggleIsDone();
    dbOperations.updateTask(task);
    notifyListeners();
    return result;
  }

  void isMarkOutToogle(Task task) {
    _tasks[_tasks.indexOf(task)].toggleIsMarkOut();
    dbOperations.updateTask(task);
    notifyListeners();
  }

  void _updateIndexs() {
    for (int i = 0; i < _tasks.length; i++) {
      _tasks[i].indexNumber = i;
      dbOperations.updateTask(_tasks[i]);
    }
  }
}
