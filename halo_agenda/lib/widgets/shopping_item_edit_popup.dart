import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../enums/quantity_kind.dart';
import '../enums/shopping_price_kind.dart';
import '../models/groups_brain.dart';
import '../models/shopping_item.dart';
import '../models/shopping_items_brain.dart';
import '../widgets/custom_dropdown_menu.dart';
import '../widgets/custom_popup_menu_button.dart';
import '../widgets/custom_textfield.dart';

class ShoppingItemEditPopup extends StatefulWidget {
  final ShoppingItem shoppingItem;

  ShoppingItemEditPopup({@required this.shoppingItem});

  @override
  _ShoppingItemEditPopupState createState() => _ShoppingItemEditPopupState();
}

class _ShoppingItemEditPopupState extends State<ShoppingItemEditPopup> {
  QuantityKind selectedQuantityKind;
  String selectedQuantityKindString;

  final shoppingItemNameTextController = TextEditingController();
  final shoppingItemQuantityTextController = TextEditingController();
  final shoppingItemPriceTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    shoppingItemNameTextController.text = widget.shoppingItem.name;
    shoppingItemQuantityTextController.text =
        widget.shoppingItem.quantityCount.toString();
    shoppingItemPriceTextController.text = widget.shoppingItem.price.toString();
    selectedQuantityKind = widget.shoppingItem.quantityKind;
    selectedQuantityKindString =
        QuantityKindClass.quantityKindLongNameList[selectedQuantityKind];
  }

  @override
  Widget build(BuildContext context) {
    var selectedGroupPriceKind =
        Provider.of<GroupsBrain>(context).selectedGroup.shoppingPriceKind;
    return AlertDialog(
      scrollable: true,
      elevation: 16,
      title: Text('Shopping Item Edit'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTextField(
            prefixIcon: kShoppingGroupIcon,
            messageTextController: shoppingItemNameTextController,
            maxLength: 30,
          ),
          CustomTextField(
            suffixText: selectedQuantityKindString,
            messageTextController: shoppingItemQuantityTextController,
          ),
          CustomDropdownMenu(
            items: QuantityKindClass.quantityKindLongNameList.values.toList(),
            onChangedFunction: (newValue) {
              setState(() {
                selectedQuantityKindString = newValue;
                selectedQuantityKind = QuantityKindClass.getLongKey(newValue);
              });
            },
            selectedValue: selectedQuantityKindString,
          ),
          CustomTextField(
            prefixIcon: ShoppingPriceKindClass
                .shoppingPriceKindIconList[selectedGroupPriceKind],
            messageTextController: shoppingItemPriceTextController,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                ShoppingPriceKindClass
                    .shoppingPriceKindShortNameList[selectedGroupPriceKind],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomPopupMenuButton(
                  'Delete',
                  color: kAppDeleteColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                    Provider.of<ShoppingItemBrain>(context, listen: false)
                        .removeShoppingItemWithDB(widget.shoppingItem);
                  },
                ),
              ),
              Expanded(
                child: CustomPopupMenuButton(
                  'Save',
                  color: kShoppingPrimaryColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                    widget.shoppingItem.name =
                        shoppingItemNameTextController.text;

                    widget.shoppingItem.quantityCount =
                        double.parse(shoppingItemQuantityTextController.text);

                    widget.shoppingItem.quantityKind = selectedQuantityKind;

                    widget.shoppingItem.price =
                        double.parse(shoppingItemPriceTextController.text);

                    Provider.of<ShoppingItemBrain>(context, listen: false)
                        .updateShoppingItem(widget.shoppingItem);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
