import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../models/group.dart';
import '../models/note.dart';
import '../models/notes_brain.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/note_tile.dart';

class NotebookScreen extends StatefulWidget {
  static const id = 'notebook_screen';
  final Group group;

  NotebookScreen({@required this.group});

  @override
  _NotebookScreenState createState() => _NotebookScreenState();
}

class _NotebookScreenState extends State<NotebookScreen> {
  final addNotebookTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NoteBrain>(context, listen: false)
        .dbOperations
        .createNotesTable();
    notes;
  }

  Future<void> get notes async {
    await Provider.of<NoteBrain>(context, listen: false)
        .getNotesFromDatabase(widget.group.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF4CD68),
        title: Text(
          widget.group.name,
          style: kGroupTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ImplicitlyAnimatedReorderableList<Note>(
              areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
              items: Provider.of<NoteBrain>(context).notes,
              onReorderFinished: (item, from, to, allList) {
                Provider.of<NoteBrain>(context, listen: false)
                  ..removeNoteWithoutDB(item)
                  ..insertNoteWithoutDB(to, item);
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
                        child: NoteTile(
                          note: item,
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
                    'images/notebookBackground.png',
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
                            '${Provider.of<NoteBrain>(context).notesCount}',
                            style: kShoppingPriceTextStyle.copyWith(
                                color: Colors.white),
                          ),
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
              hintText: 'Enter Note...',
              prefixIcon: kNotebookGroupIcon,
              suffixIcon: kAppAddIcon,
              messageTextController: addNotebookTextController,
              addOnPressedFunction: () {
//                if (addNotebookTextController.text.trim().length <= 0) return;
                FocusScope.of(context).unfocus();

                Provider.of<NoteBrain>(context, listen: false)
                    .insertNoteWithtDB(
                  0,
                  Note(
                    groupId: widget.group.id,
                    date: DateTime.now(),
                    text: addNotebookTextController.text,
                  ),
                );
                addNotebookTextController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
