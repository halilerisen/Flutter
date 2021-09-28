// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
late User loggedInUser;

class _ChatScreenState extends State<ChatScreen> {
  //Firebase
  final _auth = FirebaseAuth.instance;

  final messageTextController = TextEditingController();

  late String messageText;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: const Center(child: Text('⚡️Chat')),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: kMessageTextFieldDecoration,
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                    onPressed: () {
                      _fireStore.collection('messages').add(
                        {
                          'text': messageText,
                          'sender': _auth.currentUser?.email,
                          'timeStamp': Timestamp.now(),
                        },
                      );
                      messageTextController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          _fireStore.collection('messages').orderBy('timeStamp').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //Eğer data yok ise firebase'e bağlanıyordur
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;

        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data() as Map<String, dynamic>;

          final messageSender = message.data() as Map<String, dynamic>;

          final messageBubble = MessageBubble(
            text: messageText['text'],
            sender: messageSender['sender'],
            isMe: loggedInUser.email == messageSender['sender'],
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final text;
  final sender;
  final isMe;

  MessageBubble({
    required this.text,
    required this.sender,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 5,
            color: isMe ? Colors.white : Colors.lightBlueAccent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                  color: isMe ? Colors.black54 : Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
