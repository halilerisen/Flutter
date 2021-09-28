import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haloagenda/models/notes_brain.dart';
import 'package:haloagenda/screens/notebook_edit_screen.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../models/note.dart';
import 'custom_popup_menu_button.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  NoteTile({@required this.note});

  int get titleEndIndex {
    List<String> words = note.text.split("\n")[0].split(' ');

    if (words[0].length > 20) {
      return 20;
    }
    String temp = '';

    for (int i = 0; i < words.length; i++) {
      temp = temp + words[i] + ' ';
      if (temp.length > 20) {
        temp = temp.substring(0, (temp.length - words[i].length));
        return temp.length - 1;
      }
    }
    return temp.length - 1;
  }

  String get dateFormat {
    String mount;
    switch (note.date.month) {
      case 1:
        mount = 'Jan';
        break;
      case 2:
        mount = 'Feb';
        break;
      case 3:
        mount = 'Mar';
        break;
      case 4:
        mount = 'Apr';
        break;
      case 5:
        mount = 'May';
        break;
      case 6:
        mount = 'Jun';
        break;
      case 7:
        mount = 'Jul';
        break;
      case 8:
        mount = 'Aug';
        break;
      case 9:
        mount = 'Sep';
        break;
      case 10:
        mount = 'Oct';
        break;
      case 11:
        mount = 'Nov';
        break;
      case 12:
        mount = 'Dec';
        break;
    }
    return '$mount ${note.date.day},${note.date.hour} ${note.date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NotebookEditScreen(
              note: note,
            );
          }));
        },
        onDoubleTap: () {
          return showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Note Edit',
                    style: kNotebookEditTitleTextStyle,
                  ),
                  content: CustomPopupMenuButton(
                    'Delete',
                    color: kAppDeleteColor,
                    onPressed: () {
                      Navigator.pop(context);
                      Provider.of<NoteBrain>(context, listen: false)
                          .removeNoteWithDB(note);
                    },
                  ),
                );
              });
        },
        child: Handle(
          delay: const Duration(milliseconds: 300),
          vibrate: true,
          child: Container(
            height: 65.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: kAppPrimaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    note.text.substring(0, titleEndIndex),
                    style: kTodoTitleTextStyle,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        note.text
                            .substring(titleEndIndex)
                            .replaceAll('\n', ' ')
                            .trim(),
                        style: kTodoDescriptionTextStyle,
                      ),
                    ),
                  ),
                  Text(
                    dateFormat,
                    style: kNotebookDateTextStyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
