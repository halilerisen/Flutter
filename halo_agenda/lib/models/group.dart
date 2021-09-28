import 'package:haloagenda/enums/categories_kind.dart';
import 'package:haloagenda/enums/shopping_price_kind.dart';

class Group {
  final int id;
  final CategoriesKind category;
  String name;
  int indexNumber;
  ShoppingPriceKind shoppingPriceKind;

  Group({
    this.id,
    this.category,
    this.name,
    this.indexNumber,
    this.shoppingPriceKind,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': CategoriesKindClass.categoriesKindNameList[category],
      'indexNumber': indexNumber,
      'shoppingPriceKind': ShoppingPriceKindClass
          .shoppingPriceKindLongNameList[shoppingPriceKind],
    };
  }
}
