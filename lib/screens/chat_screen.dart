import "package:flash_chat/widgets/message_stream.dart";
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flash_chat/utils/theme.dart";
import "package:flash_chat/utils/router.dart";

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final messageController = TextEditingController();
  User currentUser;
  String messageValue;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        this.currentUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void onSendHandler() {
    _store.collection("messages").add({
      "text": this.messageValue,
      "sender": this.currentUser.email,
    });

    this.messageController.clear();
  }

  void onLogoutHandler() {
    _auth.signOut();
    Navigator.pushNamed(context, LoginScreenRoute);
  }

  @override
  void initState() {
    super.initState();
    this.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.square_arrow_left),
            onPressed: this.onLogoutHandler,
          ),
        ],
        title: Text(
          "Chat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kAccentColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(
              store: _store,
              currentUser: this.currentUser,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: this.messageController,
                      onChanged: (value) {
                        this.messageValue = value;
                      },
                      style: kMessageTextFieldStyle,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: this.onSendHandler,
                    child: Icon(
                      CupertinoIcons.paperplane,
                      color: kPrimaryColor,
                    ),
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
