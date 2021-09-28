import 'package:flutter/material.dart';
import 'package:haloagenda/enums/categories_kind.dart';
import 'package:haloagenda/enums/shopping_price_kind.dart';
import 'package:haloagenda/models/groups_brain.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../models/group.dart';
import 'custom_dropdown_menu.dart';
import 'custom_popup_menu_button.dart';
import 'custom_textfield.dart';

class GroupEditPopup extends StatefulWidget {
  final Group group;

  final groupNameTextController = TextEditingController();

  String selectedPriceKindString;
  Icon selectedPriceKindIcon;
  ShoppingPriceKind selectedPriceKind;

  GroupEditPopup({@required this.group}) {
    selectedPriceKindString = ShoppingPriceKindClass
        .shoppingPriceKindLongNameList[group.shoppingPriceKind];

    selectedPriceKind = group.shoppingPriceKind;

    selectedPriceKindIcon = ShoppingPriceKindClass
        .shoppingPriceKindIconList[group.shoppingPriceKind];

    groupNameTextController.text = group.name;
  }

  @override
  _GroupEditPopupState createState() => _GroupEditPopupState();
}

class _GroupEditPopupState extends State<GroupEditPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      elevation: 16,
      title: Text('Group Edit'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTextField(
            prefixIcon: kGroupsIcon,
            maxLength: 20,
            messageTextController: widget.groupNameTextController,
          ),
          Visibility(
            visible:
                widget.group.category == CategoriesKind.shopping ? true : false,
            child: CustomDropdownMenu(
              items: ShoppingPriceKindClass.shoppingPriceKindLongNameList.values
                  .toList(),
              onChangedFunction: (newValue) {
                setState(() {
                  widget.selectedPriceKindString = newValue;
                  widget.selectedPriceKind =
                      ShoppingPriceKindClass.getLongKey(newValue);
                  widget.selectedPriceKindIcon = ShoppingPriceKindClass
                      .shoppingPriceKindIconList[widget.selectedPriceKind];
                });
              },
              selectedValue: widget.selectedPriceKindString,
              prefixIcon: widget.selectedPriceKindIcon,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomPopupMenuButton(
                  'Delete',
                  color: kAppDeleteColor,
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<GroupsBrain>(context, listen: false)
                        .removeGroupWithDB(widget.group);
                  },
                ),
              ),
              Expanded(
                child: CustomPopupMenuButton(
                  'Save',
                  color: kNotebookTextEditColor,
                  onPressed: () {
                    Navigator.pop(context);
                    widget.group.name = widget.groupNameTextController.text;
                    widget.group.shoppingPriceKind = widget.selectedPriceKind;

                    Provider.of<GroupsBrain>(context, listen: false)
                        .updateGroup(widget.group);
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
