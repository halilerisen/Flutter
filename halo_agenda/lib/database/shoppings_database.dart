import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../enums/quantity_kind.dart';
import '../models/shopping_item.dart';

class ShoppingItemDatabase {
  final String _dbName = 'halo_todo.db';
  static const String shoppingItemsTableName = 'shopping_items';

  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: 1,
    );
  }

  Future<void> createShoppingItemsTable() async {
    final Database db = await database;

    try {
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE $shoppingItemsTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          quantityCount REAL NOT NULL,
          quantityKind TEXT NOT NULL,
          price REAL NOT NULL,
          indexNumber INTEGER,
          groupId INTEGER NOT NULL,
          isDone INTEGER NOT NULL,
          isMarkOut INTEGER NOT NULL
          )
          ''');
      });
    } catch (e) {}
  }

  Future<List<ShoppingItem>> getShoppingItems(int groupId) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      '$shoppingItemsTableName',
      where: 'groupId = ?',
      whereArgs: [groupId],
      orderBy: 'indexNumber',
    );

    return List.generate(maps.length, (i) {
      return ShoppingItem(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isDone: maps[i]['isDone'] == 0 ? false : true,
        isMarkOut: maps[i]['isMarkOut'] == 0 ? false : true,
        groupId: maps[i]['groupId'],
        price: maps[i]['price'],
        quantityCount: maps[i]['quantityCount'],
        quantityKind: QuantityKindClass.getLongKey(maps[i]['quantityKind']),
        indexNumber: maps[i]['indexNumber'],
      );
    });
  }

  Future<int> addShoppingItem(ShoppingItem shoppingItem) async {
    final Database db = await database;

    int id = await db.insert(
      shoppingItemsTableName,
      shoppingItem.toMap(),
    );

    return id;
  }

  Future<void> removeShoppingItem(ShoppingItem shoppingItem) async {
    final db = await database;
    await db.delete(
      '$shoppingItemsTableName',
      where: 'id = ?',
      whereArgs: [shoppingItem.id],
    );
  }

  Future<void> updateShoppingItem(ShoppingItem shoppingItem) async {
    final db = await database;

    await db.update(
      '$shoppingItemsTableName',
      shoppingItem.toMap(),
      where: "id = ?",
      whereArgs: [shoppingItem.id],
    );
  }
}
