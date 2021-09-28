import 'package:flutter/cupertino.dart';
import 'package:haloagenda/database/notebooks_database.dart';

import 'note.dart';

class NoteBrain extends ChangeNotifier {
  final List<Note> _notes = [];

  final NotebookDatabase _dbOperations = NotebookDatabase();

  List<Note> get notes => List.unmodifiable(_notes);

  NotebookDatabase get dbOperations => _dbOperations;

  int get notesCount => _notes.length;

  Future<void> getNotesFromDatabase(int groupId) async {
    _notes.clear();
    List<Note> shoppingItemsDB = await _dbOperations.getNotes(groupId);
    _notes.addAll(shoppingItemsDB);
    notifyListeners();
  }

  void insertNoteWithoutDB(int index, Note note) {
    _notes.insert(index, note);
    _updateIndexs();
    notifyListeners();
  }

  void insertNoteWithtDB(int index, Note note) async {
    int id = await dbOperations.addNote(note);
    _notes.insert(
        index,
        Note(
          id: id,
          groupId: note.groupId,
          indexNumber: note.indexNumber,
          date: note.date,
          text: note.text,
        ));
    _updateIndexs();
    notifyListeners();
  }

  void removeNoteWithoutDB(Note note) {
    _notes.remove(note);
    notifyListeners();
  }

  void removeNoteWithDB(Note note) {
    dbOperations.removeNote(note);
    _notes.remove(note);
    notifyListeners();
  }

  void updateNote(Note note) {
    dbOperations.updateNote(note);
    _notes[_notes.indexOf(note)] = note;
    notifyListeners();
//    dbOperations.updateTask(task);
  }

  void _updateIndexs() {
    for (int i = 0; i < _notes.length; i++) {
      _notes[i].indexNumber = i;
      dbOperations.updateNote(_notes[i]);
    }
  }
}
