import 'package:flutter/material.dart';
import 'package:haloagenda/models/notes_brain.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../models/note.dart';

class NotebookEditScreen extends StatefulWidget {
  final Note note;

  NotebookEditScreen({this.note});

  static const id = 'notebook_edit_screen';

  @override
  _NotebookEditScreenState createState() => _NotebookEditScreenState();
}

class _NotebookEditScreenState extends State<NotebookEditScreen> {
  final messageTextController = TextEditingController();

  int get titleEndIndex {
    List<String> words = widget.note.text.split("\n")[0].split(' ');

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

  @override
  void initState() {
    super.initState();
    messageTextController.text = widget.note.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.note.text.substring(0, titleEndIndex)}',
          style: kNotebookEditTitleTextStyle,
        ),
        backgroundColor: kAppPrimaryColor,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: kNotebookPrimaryColor,
        ),
      ),
      body: TextField(
        minLines: null,
        maxLines: null,
        expands: true,
        controller: messageTextController,
        onChanged: (newValue) {
          setState(() {
            widget.note.text = newValue;
          });
          Provider.of<NoteBrain>(context, listen: false)
              .updateNote(widget.note);
        },
        style: kNotebookEditTextStyle,
        cursorColor: kNotebookPrimaryColor,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
