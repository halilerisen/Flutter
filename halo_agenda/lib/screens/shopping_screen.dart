import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../enums/shopping_price_kind.dart';
import '../models/group.dart';
import '../models/shopping_item.dart';
import '../models/shopping_items_brain.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/shopping_item_tile.dart';

class ShoppingScreen extends StatefulWidget {
  static const id = 'shopping_screen';
  final Group group;

  ShoppingScreen({@required this.group});

  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final addGroupTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ShoppingItemBrain>(context, listen: false)
        .dbOperations
        .createShoppingItemsTable();
    shoppingItems;
  }

  Future<void> get shoppingItems async {
    await Provider.of<ShoppingItemBrain>(context, listen: false)
        .getShoppingItemsFromDatabase(widget.group.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF09C6A2),
        title: Text(
          widget.group.name,
          style: kGroupTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ImplicitlyAnimatedReorderableList<ShoppingItem>(
              areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
              items: Provider.of<ShoppingItemBrain>(context).shoppingItems,
              onReorderFinished: (item, from, to, allList) {
                Provider.of<ShoppingItemBrain>(context, listen: false)
                  ..removeShoppingItemWithoutDB(item)
                  ..insertShoppingItemWithoutDB(to, item);
              },
              itemBuilder: (context, itemAnimation, item, index) {
                return Reorderable(
                  key: ValueKey(item),
                  builder: (context, dragAnimation, inDrag) {
                    final t = dragAnimation.value;
                    final color = Color.lerp(
                        Colors.white, Colors.white.withOpacity(0.8), t);

                    return SizeFadeTransition(
                      sizeFraction: 0.7,
                      curve: Curves.slowMiddle,
                      animation: itemAnimation,
                      child: Material(
                        color: color,
                        type: MaterialType.transparency,
                        child: ShoppingItemTile(
                          shoppingItem: item,
                        ),
                      ),
                    );
                  },
                );
              },
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    'images/shoppingBackground.png',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Shopping Items : '
                            '${Provider.of<ShoppingItemBrain>(context).shoppingItemDoneCount}/'
                            '${Provider.of<ShoppingItemBrain>(context).shoppingItemsCount}',
                            style: kShoppingPriceTextStyle.copyWith(
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          'Total Price :  ',
                          style: kShoppingPriceTextStyle.copyWith(
                              color: Colors.white),
                        ),
                        Text(
                          '${Provider.of<ShoppingItemBrain>(context).totalPrice} '
                          '${ShoppingPriceKindClass.shoppingPriceKindShortNameList[widget.group.shoppingPriceKind]}',
                          style: kShoppingPriceTextStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              scrollDirection: Axis.vertical,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomTextField(
              hintText: 'Enter Shopping Item...',
              prefixIcon: kShoppingGroupIcon,
              suffixIcon: kAppAddIcon,
              maxLength: 30,
              messageTextController: addGroupTextController,
              addOnPressedFunction: () {
                if (addGroupTextController.text.length <= 0) return;
                FocusScope.of(context).unfocus();

                Provider.of<ShoppingItemBrain>(context, listen: false)
                    .insertShoppingItemWithDB(
                  0,
                  ShoppingItem(
                    name: addGroupTextController.text,
                    groupId: widget.group.id,
                  ),
                );
                addGroupTextController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
