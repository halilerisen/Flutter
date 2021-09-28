import 'package:flutter/material.dart';
import 'package:haloagenda/widgets/group_add_popup.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../models/group.dart';
import '../models/groups_brain.dart';
import '../widgets/group_tile.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<GroupsBrain>(context, listen: false)
        .dbOperations
        .createGroupsTable();
    groups;
  }

  Future<void> get groups async {
    await Provider.of<GroupsBrain>(context, listen: false).groupsFromDatabase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halo Agenda',
          style: kHomeScreenTitleTextStyle,
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          return showDialog<void>(
              context: context,
              builder: (context) {
                return GroupAddPopup();
              });
        },
        child: kGroupAddIcon,
        backgroundColor: Color(0xFFD3D3D3),
        splashColor: kAppPrimaryColor,
      ),
      body: ImplicitlyAnimatedReorderableList<Group>(
        areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
        items: Provider.of<GroupsBrain>(context).groups,
        onReorderFinished: (item, from, to, allList) {
          Provider.of<GroupsBrain>(context, listen: false)
            ..removeGroupWithoutDB(item)
            ..insertGroupWithoutDB(to, item);
        },
        itemBuilder: (context, itemAnimation, item, index) {
          return Reorderable(
            key: ValueKey(item),
            builder: (context, dragAnimation, inDrag) {
              final t = dragAnimation.value;
              final color =
                  Color.lerp(Colors.white, Colors.white.withOpacity(0.8), t);

              return SizeFadeTransition(
                sizeFraction: 0.7,
                curve: Curves.slowMiddle,
                animation: itemAnimation,
                child: Material(
                  color: color,
                  type: MaterialType.transparency,
                  child: GroupTile(
                    group: item,
                  ),
                ),
              );
            },
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
