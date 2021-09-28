import 'package:flutter/material.dart';
import 'package:haloagenda/constans.dart';
import 'package:haloagenda/models/groups_brain.dart';
import 'package:haloagenda/models/notes_brain.dart';
import 'package:haloagenda/models/shopping_items_brain.dart';
import 'package:haloagenda/models/tasks_brain.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './screens/notebook_edit_screen.dart';
import './screens/notebook_screen.dart';
import './screens/shopping_screen.dart';
import './screens/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List<String> items = ['Until Date', 'Repeat One', 'Repeat'];
String selectedValue = items[0];

class _MyAppState extends State<MyApp> {
//  List<Task> tasks = [Task(id: 1, test: 'test')];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GroupsBrain(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShoppingItemBrain(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskBrain(),
        ),
        ChangeNotifierProvider(
          create: (context) => NoteBrain(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kAppBackgroundColor,
            appBarTheme: AppBarTheme(color: kAppPrimaryColor)),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          NotebookEditScreen.id: (context) => NotebookEditScreen(),
          NotebookScreen.id: (context) => NotebookScreen(
                group: Provider.of<GroupsBrain>(context).selectedGroup,
              ),
          ShoppingScreen.id: (context) => ShoppingScreen(
                group: Provider.of<GroupsBrain>(context).selectedGroup,
              ),
          TodoScreen.id: (context) => TodoScreen(
                group: Provider.of<GroupsBrain>(context).selectedGroup,
              ),
        },
      ),
    );
  }
}

/*
ImplicitlyAnimatedReorderableList<Task>(
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            items: tasks,
            onReorderFinished: (item, from, to, allList) {
              setState(() {
                tasks
                  ..remove(item)
                  ..insert(to, item);
              });
            },
            itemBuilder: (context, itemAnimation, item, index) {
              // Each item must be wrapped in a Reorderable widget.
              return Reorderable(
                // Each item must have an unique key.
                key: ValueKey(item),
                // The animation of the Reorderable builder can be used to
                // change to appearance of the item between dragged and normal
                // state. For example to add elevation when the item is being dragged.
                // This is not to be confused with the animation of the itemBuilder.
                // Implicit animations (like AnimatedContainer) are sadly not yet supported.
                builder: (context, dragAnimation, inDrag) {
                  final t = dragAnimation.value;
                  final elevation = lerpDouble(0, 8, t);
                  final color = Color.lerp(
                      Colors.white, Colors.white.withOpacity(0.8), t);

                  return SizeFadeTransition(
                    sizeFraction: 0.7,
                    curve: Curves.slowMiddle,
                    animation: itemAnimation,
                    child: Material(
                      color: color,
                      elevation: elevation,
                      type: MaterialType.transparency,
                      child: ListTile(
                        title: Text(item.test),
                        // The child of a Handle can initialize a drag/reorder.
                        // This could for example be an Icon or the whole item itself. You can
                        // use the delay parameter to specify the duration for how long a pointer
                        // must press the child, until it can be dragged.
                        trailing: Handle(
                          delay: const Duration(milliseconds: 10),
                          vibrate: true,
                          child: Icon(
                            Icons.list,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            scrollDirection: Axis.vertical,
            header: Container(
              height: 300,
              color: kAppBackgroundColor,
            ),
            shrinkWrap: true,
          ),
 */
