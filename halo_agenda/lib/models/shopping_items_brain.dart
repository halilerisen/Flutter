import 'package:flutter/cupertino.dart';

import '../database/shoppings_database.dart';
import '../models/shopping_item.dart';

class ShoppingItemBrain extends ChangeNotifier {
  final List<ShoppingItem> _shoppingItems = [];

  final ShoppingItemDatabase _dbOperations = ShoppingItemDatabase();

  List<ShoppingItem> get shoppingItems => List.unmodifiable(_shoppingItems);

  ShoppingItemDatabase get dbOperations => _dbOperations;

  String get totalPrice {
    double total = 0.0;
    for (int i = 0; i < _shoppingItems.length; i++) {
      if (!_shoppingItems[i].isDone && !_shoppingItems[i].isMarkOut) {
        total += _shoppingItems[i].price * _shoppingItems[i].quantityCount;
      }
    }
    return total.toStringAsFixed(2);
  }

  int get shoppingItemDoneCount {
    int isDone = 0;
    for (int i = 0; i < _shoppingItems.length; i++) {
      if (_shoppingItems[i].isDone || _shoppingItems[i].isMarkOut) isDone++;
    }
    return isDone;
  }

  int get shoppingItemsCount => _shoppingItems.length;

  Future<void> getShoppingItemsFromDatabase(int groupId) async {
    _shoppingItems.clear();
    List<ShoppingItem> shoppingItemsDB =
        await _dbOperations.getShoppingItems(groupId);
    _shoppingItems.addAll(shoppingItemsDB);
    notifyListeners();
  }

  void addShoppingItemWithoutDB(ShoppingItem shoppingItem) {
    _shoppingItems.add(shoppingItem);
    _updateIndexs();
    notifyListeners();
  }

  void insertShoppingItemWithoutDB(int index, ShoppingItem shoppingItem) {
    _shoppingItems.insert(index, shoppingItem);
    _updateIndexs();
    notifyListeners();
  }

  void insertShoppingItemWithDB(int index, ShoppingItem shoppingItem) async {
    int id = await dbOperations.addShoppingItem(shoppingItem);
    _shoppingItems.insert(
        index,
        ShoppingItem(
          id: id,
          isDone: shoppingItem.isDone,
          isMarkOut: shoppingItem.isMarkOut,
          price: shoppingItem.price,
          quantityCount: shoppingItem.quantityCount,
          quantityKind: shoppingItem.quantityKind,
          groupId: shoppingItem.groupId,
          indexNumber: shoppingItem.indexNumber,
          name: shoppingItem.name,
        ));
    _updateIndexs();
    notifyListeners();
  }

  void removeShoppingItemWithoutDB(ShoppingItem shoppingItem) {
    _shoppingItems.remove(shoppingItem);
    notifyListeners();
  }

  void removeShoppingItemWithDB(ShoppingItem shoppingItem) {
    dbOperations.removeShoppingItem(shoppingItem);
    _shoppingItems.remove(shoppingItem);
    notifyListeners();
  }

  void updateShoppingItem(ShoppingItem shoppingItem) {
    dbOperations.updateShoppingItem(shoppingItem);
    _shoppingItems[_shoppingItems.indexOf(shoppingItem)] = shoppingItem;
    notifyListeners();
  }

  bool isDoneToogle(ShoppingItem shoppingItem) {
    bool result =
        _shoppingItems[_shoppingItems.indexOf(shoppingItem)].toggleIsDone();
    dbOperations.updateShoppingItem(shoppingItem);
    notifyListeners();
    return result;
  }

  void isMarkOutToogle(ShoppingItem shoppingItem) {
    _shoppingItems[_shoppingItems.indexOf(shoppingItem)].toggleIsMarkOut();
    dbOperations.updateShoppingItem(shoppingItem);
    notifyListeners();
  }

  void _updateIndexs() {
    for (int i = 0; i < _shoppingItems.length; i++) {
      _shoppingItems[i].indexNumber = i;
      dbOperations.updateShoppingItem(_shoppingItems[i]);
    }
  }
}
