import 'package:haloagenda/enums/quantity_kind.dart';

class ShoppingItem {
  final int id;
  final int groupId;
  String name;
  double quantityCount;
  QuantityKind quantityKind;
  double price;
  int indexNumber;
  bool isDone;
  bool isMarkOut;

  ShoppingItem({
    this.id,
    this.name,
    this.indexNumber,
    this.groupId,
    this.isDone = false,
    this.isMarkOut = false,
    this.price = 1.0,
    this.quantityCount = 1.0,
    this.quantityKind = QuantityKind.kilogram,
  });

  bool toggleIsDone() {
    isDone = !isDone;
    return isDone;
  }

  bool toggleIsMarkOut() {
    isMarkOut = !isMarkOut;
    return isMarkOut;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'indexNumber': indexNumber,
      'groupId': groupId,
      'isDone': isDone ? 1 : 0,
      'isMarkOut': isMarkOut ? 1 : 0,
      'price': price,
      'quantityCount': quantityCount,
      'quantityKind': QuantityKindClass.quantityKindLongNameList[quantityKind],
    };
  }
}
