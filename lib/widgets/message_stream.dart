import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/utils/theme.dart';
import 'package:flash_chat/widgets/message_bubble.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    @required this.store,
    @required this.currentUser,
  });

  final FirebaseFirestore store;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection("messages").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
          );
        }

        final messages = snapshot.data.docs.reversed;
        List<Widget> messagesWidgets = [];

        for (var message in messages) {
          final text = message.data()["text"];
          final sender = message.data()["sender"];

          messagesWidgets.add(MessageBubble(
            sender: sender,
            text: text,
            isMe: this.currentUser.email == sender,
          ));
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: kSizeMedium,
              vertical: kSizeLarge,
            ),
            children: messagesWidgets,
          ),
        );
      },
    );
  }
}
