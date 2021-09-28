import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../enums/quantity_kind.dart';
import '../enums/shopping_price_kind.dart';
import '../models/groups_brain.dart';
import '../models/shopping_item.dart';
import '../models/shopping_items_brain.dart';
import '../widgets/shopping_item_edit_popup.dart';

class ShoppingItemTile extends StatelessWidget {
  final ShoppingItem shoppingItem;

  ShoppingItemTile({this.shoppingItem});

  String get _quantityCount {
    if (shoppingItem.quantityCount != null && shoppingItem.quantityCount != 0) {
      return '${shoppingItem.quantityCount.toString()} $_quantityKind';
    }
    return '';
  }

  String get _quantityKind {
    return QuantityKindClass
        .quantityKindShortNameList[shoppingItem.quantityKind];
  }

  String get _price {
    if (shoppingItem.price != null && shoppingItem.price != 0.0) {
      return '${(shoppingItem.price * shoppingItem.quantityCount).toString()} $_selectedPriceKind';
    }
    return '';
  }

  String _selectedPriceKind = '';
  @override
  Widget build(BuildContext context) {
    var selectedGroupPriceKind =
        Provider.of<GroupsBrain>(context).selectedGroup.shoppingPriceKind;

    _selectedPriceKind = ShoppingPriceKindClass
        .shoppingPriceKindShortNameList[selectedGroupPriceKind];
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: () async {
          return showDialog<void>(
              context: context,
              builder: (context) {
                return ShoppingItemEditPopup(
                  shoppingItem: shoppingItem,
                );
              });
        },
        onDoubleTap: () {
          Provider.of<ShoppingItemBrain>(context, listen: false)
              .isMarkOutToogle(shoppingItem);
        },
        onLongPress: () {
          bool res = Provider.of<ShoppingItemBrain>(context, listen: false)
              .isDoneToogle(shoppingItem);
          if (res) {
            Provider.of<ShoppingItemBrain>(context, listen: false)
                .removeShoppingItemWithoutDB(shoppingItem);
            Provider.of<ShoppingItemBrain>(context, listen: false)
                .addShoppingItemWithoutDB(shoppingItem);
          } else {
            Provider.of<ShoppingItemBrain>(context, listen: false)
                .removeShoppingItemWithoutDB(shoppingItem);
            Provider.of<ShoppingItemBrain>(context, listen: false)
                .insertShoppingItemWithoutDB(0, shoppingItem);
          }
        },
        child: Container(
          color: kAppPrimaryColor,
          height: 50.0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(
                      shoppingItem.name,
                      style: kShoppingTitleTextStyle.copyWith(
                        decoration:
                            (shoppingItem.isDone || shoppingItem.isMarkOut)
                                ? TextDecoration.lineThrough
                                : null,
                        decorationColor: shoppingItem.isDone
                            ? Color(0xAAFFFFFF)
                            : shoppingItem.isMarkOut ? Color(0xAA00FF09) : null,
                        decorationThickness:
                            (shoppingItem.isDone || shoppingItem.isMarkOut)
                                ? 7.0
                                : null,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    _quantityCount,
                    style: kShoppingQuantityTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    _price,
                    style: kShoppingPriceTextStyle,
                  ),
                ),
                Handle(
                  delay: const Duration(milliseconds: 10),
                  vibrate: true,
                  child: kDragHandleIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
