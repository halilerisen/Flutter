import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:haloagenda/database/groups_database.dart';

import 'group.dart';

class GroupsBrain extends ChangeNotifier {
  List<Group> _groups = [];

  final GroupDatabase _dbOperations = GroupDatabase();

  Group selectedGroup;

  UnmodifiableListView<Group> get groups => UnmodifiableListView(_groups);

  GroupDatabase get dbOperations => _dbOperations;

  Future<void> get groupsFromDatabase async {
    _groups.clear();
    List<Group> groupsDB = await _dbOperations.groups;
    _groups.addAll(groupsDB);
    notifyListeners();
  }

  void insertGroupWithoutDB(int index, Group group) {
    _groups.insert(index, group);
    _updateIndexs();
    notifyListeners();
  }

  void insertGroupWithDB(int index, Group group) async {
    int id = await dbOperations.addGroup(group);
    _groups.insert(
        index,
        Group(
          id: id,
          name: group.name,
          category: group.category,
          shoppingPriceKind: group.shoppingPriceKind,
          indexNumber: group.indexNumber,
        ));
    _updateIndexs();
    notifyListeners();
  }

  void removeGroupWithoutDB(Group group) {
    _groups.remove(group);
    notifyListeners();
  }

  void removeGroupWithDB(Group group) {
    dbOperations.removeGroup(group);
    _groups.remove(group);
    notifyListeners();
  }

  void updateGroup(Group group) {
    dbOperations.updateGroup(group);
    _groups[_groups.indexOf(group)] = group;
    notifyListeners();
  }

  void _updateIndexs() {
    for (int i = 0; i < _groups.length; i++) {
      _groups[i].indexNumber = i;
      dbOperations.updateGroup(_groups[i]);
    }
  }
}
