import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../enums/priority_kind.dart';
import '../enums/repeat_kind.dart';
import '../models/task.dart';

class TasksDatabase {
  final String _dbName = 'halo_todo.db';
  static const String tasksTableName = 'tasks';

  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: 1,
    );
  }

  Future<void> createTasksTable() async {
    final Database db = await database;
    try {
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE $tasksTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          description TEXT,
          indexNumber INTEGER,
          date TEXT,
          nextId INTEGER,
          repeatCount INTEGER NOT NULL,
          priority TEXT NOT NULL,
          groupId INTEGER NOT NULL,
          isDone INTEGER NOT NULL,
          isMarkOut INTEGER NOT NULL,
          repeatKind TEXT NOT NULL,
          repeatDistance INTEGER NOT NULL
          )
          ''');
      });
    } catch (e) {}
  }

  Future<List<Task>> getTasks(int groupId) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      '$tasksTableName',
      where: 'groupId = ?',
      whereArgs: [groupId],
      orderBy: 'indexNumber',
    );

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
        date: maps[i]['date'] == null ? DateTime.parse(maps[i]['date']) : null,
        priority: PriorityKindClass.getNameKey(maps[i]['priority']),
        indexNumber: maps[i]['indexNumber'],
        groupId: maps[i]['groupId'],
        isMarkOut: maps[i]['isMarkOut'] == 0 ? false : true,
        isDone: maps[i]['isDone'] == 0 ? false : true,
        repeatDistance: maps[i]['repeatDistance'],
        repeatCount: maps[i]['repeatCount'],
        repeatKind: RepeatKindClass.getNameKey(maps[i]['repeatKind']),
        nextId: maps[i]['nextId'],
      );
    });
  }

  Future<int> addTask(Task task) async {
    final Database db = await database;

    int id = await db.insert(
      tasksTableName,
      task.toMap(),
    );

    return id;
  }

  Future<void> removeTask(Task task) async {
    final db = await database;
    await db.delete(
      '$tasksTableName',
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> updateTask(Task task) async {
    final db = await database;

    await db.update(
      '$tasksTableName',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }
}
