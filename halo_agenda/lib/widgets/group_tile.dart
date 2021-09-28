import 'package:flutter/material.dart';
import 'package:haloagenda/models/groups_brain.dart';
import 'package:haloagenda/screens/notebook_screen.dart';
import 'package:haloagenda/screens/shopping_screen.dart';
import 'package:haloagenda/screens/todo_screen.dart';
import 'package:haloagenda/widgets/group_edit_popup.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../enums/categories_kind.dart';
import '../models/group.dart';

class GroupTile extends StatelessWidget {
  final Group group;

  GroupTile({@required this.group});

  Icon get groupIcon {
    return CategoriesKindClass.categoriesKindIconList[group.category];
  }

  Color get groupColor {
    return CategoriesKindClass.categoriesKindColorList[group.category];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: groupColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Provider.of<GroupsBrain>(context, listen: false).selectedGroup =
                group;
            Navigator.pushNamed(
                context,
                group.category == CategoriesKind.shopping
                    ? ShoppingScreen.id
                    : group.category == CategoriesKind.todo
                        ? TodoScreen.id
                        : NotebookScreen.id);
          },
          onLongPress: () async {
            return showDialog<void>(
                context: context,
                builder: (context) {
                  return GroupEditPopup(
                    group: group,
                  );
                });
          },
          child: Container(
            decoration: BoxDecoration(
              color: kAppPrimaryColor,
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    group.name,
                    style: kGroupTitleTextStyle,
                  ),
                  Handle(
                    delay: const Duration(milliseconds: 10),
                    vibrate: true,
                    child: groupIcon,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
