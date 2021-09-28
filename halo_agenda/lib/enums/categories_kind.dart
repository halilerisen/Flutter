import 'package:flutter/cupertino.dart';
import 'package:haloagenda/constans.dart';

enum CategoriesKind { todo, shopping, notebook }

class CategoriesKindClass {
  static const Map<CategoriesKind, String> _categoriesKindNameList = {
    CategoriesKind.shopping: 'Shopping',
    CategoriesKind.todo: 'Todo',
    CategoriesKind.notebook: 'Notebook',
  };

  static const Map<CategoriesKind, Icon> _categoriesKindIconList = {
    CategoriesKind.shopping: kShoppingGroupIcon,
    CategoriesKind.todo: kTodoGroupIcon,
    CategoriesKind.notebook: kNotebookGroupIcon,
  };

  static const Map<CategoriesKind, Color> _categoriesKindColorList = {
    CategoriesKind.shopping: kShoppingPrimaryColor,
    CategoriesKind.todo: kTodoPrimaryColor,
    CategoriesKind.notebook: kNotebookPrimaryColor,
  };

  static Map<CategoriesKind, String> get categoriesKindNameList =>
      Map.unmodifiable(_categoriesKindNameList);

  static Map<CategoriesKind, Icon> get categoriesKindIconList =>
      Map.unmodifiable(_categoriesKindIconList);

  static Map<CategoriesKind, Color> get categoriesKindColorList =>
      Map.unmodifiable(_categoriesKindColorList);

  static CategoriesKind getCategoryKey(String value) {
    if (value == null) return null;
    return _categoriesKindNameList.keys
        .firstWhere((element) => _categoriesKindNameList[element] == value);
  }
}
