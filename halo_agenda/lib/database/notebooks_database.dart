import 'package:haloagenda/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotebookDatabase {
  final String _dbName = 'halo_todo.db';
  static const String notesTable = 'notes';

  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: 1,
    );
  }

  Future<void> createNotesTable() async {
    final Database db = await database;
    try {
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE $notesTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          text TEXT,
          date TEXT,
          indexNumber INTEGER,
          groupId INTEGER NOT NULL
          )
          ''');
      });
    } catch (e) {}
  }

  Future<List<Note>> getNotes(int groupId) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      '$notesTable',
      where: 'groupId = ?',
      whereArgs: [groupId],
      orderBy: 'indexNumber',
    );
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        text: maps[i]['text'],
        date: DateTime.parse(maps[i]['date']),
        groupId: maps[i]['groupId'],
        indexNumber: maps[i]['indexNumber'],
      );
    });
  }

  Future<int> addNote(Note note) async {
    final Database db = await database;

    int id = await db.insert(
      notesTable,
      note.toMap(),
    );

    return id;
  }

  Future<void> removeNote(Note note) async {
    final db = await database;
    await db.delete(
      '$notesTable',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> updateNote(Note note) async {
    final db = await database;

    await db.update(
      '$notesTable',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
