import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/utils/theme.dart';
import 'package:flash_chat/widgets/message_bubble.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    Key key,
    @required FirebaseFirestore store,
  })  : _store = store,
        super(key: key);

  final FirebaseFirestore _store;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.collection("messages").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
          );
        }

        final messages = snapshot.data.docs;
        List<Widget> messagesWidgets = [];

        for (var message in messages) {
          final text = message.data()["text"];
          final sender = message.data()["sender"];
          messagesWidgets.add(MessageBubble(
            sender: sender,
            text: text,
          ));
        }

        return Expanded(
          child: ListView(
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
