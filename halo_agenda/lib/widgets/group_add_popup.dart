import 'package:flutter/material.dart';
import 'package:haloagenda/enums/categories_kind.dart';
import 'package:haloagenda/enums/shopping_price_kind.dart';
import 'package:haloagenda/models/group.dart';
import 'package:haloagenda/models/groups_brain.dart';
import 'package:provider/provider.dart';

import './custom_dropdown_menu.dart';
import '../constans.dart';
import '../widgets/custom_popup_menu_button.dart';
import '../widgets/custom_textfield.dart';

class GroupAddPopup extends StatefulWidget {
  @override
  _GroupAddPopupState createState() => _GroupAddPopupState();
}

class _GroupAddPopupState extends State<GroupAddPopup> {
  final groupNameTextController = TextEditingController();

  String selectedPriceKindString = ShoppingPriceKindClass
      .shoppingPriceKindLongNameList[ShoppingPriceKind.turkishLira];
  Icon selectedPriceKindIcon = kTurkishLiraIcon;
  ShoppingPriceKind selectedPriceKind = ShoppingPriceKind.turkishLira;
  bool priceKindVisibility = true;

  CategoriesKind selectedCategory = CategoriesKind.shopping;
  String selectedCategoryString =
      CategoriesKindClass.categoriesKindNameList[CategoriesKind.shopping];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      elevation: 16,
      title: Text('Group Add'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTextField(
            prefixIcon: kGroupsIcon,
            maxLength: 20,
            keyboardType: TextInputType.text,
            messageTextController: groupNameTextController,
            hintText: 'Grup ismi giriniz...',
          ),
          CustomDropdownMenu(
            items: CategoriesKindClass.categoriesKindNameList.values.toList(),
            onChangedFunction: (newValue) {
              setState(() {
                selectedCategoryString = newValue;
                selectedCategory = CategoriesKindClass.getCategoryKey(newValue);
                priceKindVisibility =
                    selectedCategory == CategoriesKind.shopping ? true : false;
              });
            },
            selectedValue: selectedCategoryString,
            prefixIcon: kGroupsCategoryIcon,
          ),
          Visibility(
            visible: priceKindVisibility,
            child: CustomDropdownMenu(
              items: ShoppingPriceKindClass.shoppingPriceKindLongNameList.values
                  .toList(),
              onChangedFunction: (newValue) {
                setState(() {
                  selectedPriceKindString = newValue;
                  selectedPriceKind =
                      ShoppingPriceKindClass.getLongKey(newValue);
                  selectedPriceKindIcon = ShoppingPriceKindClass
                      .shoppingPriceKindIconList[selectedPriceKind];
                });
              },
              selectedValue: selectedPriceKindString,
              prefixIcon: selectedPriceKindIcon,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomPopupMenuButton(
                  'Kaydet',
                  color: kNotebookTextEditColor,
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<GroupsBrain>(context, listen: false)
                        .insertGroupWithDB(
                      0,
                      Group(
                        name: groupNameTextController.text,
                        shoppingPriceKind:
                            selectedCategory == CategoriesKind.shopping
                                ? selectedPriceKind
                                : null,
                        category: selectedCategory,
                      ),
                    );

                    groupNameTextController.clear();
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
