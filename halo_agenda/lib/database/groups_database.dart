import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../database/notebooks_database.dart';
import '../database/shoppings_database.dart';
import '../database/tasks_database.dart';
import '../enums/categories_kind.dart';
import '../enums/shopping_price_kind.dart';
import '../models/group.dart';

class GroupDatabase {
  final String _dbName = 'halo_todo.db';
  static const String _groupsTableName = 'groups';

  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: 1,
    );
  }

  Future<List<Group>> get groups async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      '$_groupsTableName',
      orderBy: 'indexNumber',
    );

    return List.generate(maps.length, (i) {
      return Group(
        id: maps[i]['id'],
        name: maps[i]['name'],
        category: CategoriesKindClass.getCategoryKey(maps[i]['category']),
        indexNumber: maps[i]['indexNumber'],
        shoppingPriceKind:
            ShoppingPriceKindClass.getLongKey(maps[i]['shoppingPriceKind']),
      );
    });
  }

  Future<void> createGroupsTable() async {
    final Database db = await database;

    try {
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE $_groupsTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          category TEXT NOT NULL,
          indexNumber INTEGER,
          shoppingPriceKind TEXT
          )
          ''');
      });
    } catch (e) {}
  }

  Future<int> addGroup(Group group) async {
    final Database db = await database;

    int id = await db.insert(
      _groupsTableName,
      group.toMap(),
    );

    return id;
  }

  Future<void> removeGroup(Group group) async {
    final db = await database;
    await db.delete(
      '$_groupsTableName',
      where: 'id = ?',
      whereArgs: [group.id],
    );

    switch (group.category) {
      case CategoriesKind.todo:
        await db.delete(
          '${TasksDatabase.tasksTableName}',
          where: 'groupId = ?',
          whereArgs: [group.id],
        );
        break;
      case CategoriesKind.shopping:
        await db.delete(
          '${ShoppingItemDatabase.shoppingItemsTableName}',
          where: 'groupId = ?',
          whereArgs: [group.id],
        );
        break;
      case CategoriesKind.notebook:
        await db.delete(
          '${NotebookDatabase.notesTable}',
          where: 'groupId = ?',
          whereArgs: [group.id],
        );
        break;
    }
  }

  Future<void> updateGroup(Group group) async {
    final db = await database;

    await db.update(
      '$_groupsTableName',
      group.toMap(),
      where: "id = ?",
      whereArgs: [group.id],
    );
  }
}
