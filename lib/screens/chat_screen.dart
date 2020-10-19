import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flash_chat/utils/theme.dart';
import 'package:flash_chat/utils/router.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
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

  @override
  void initState() {
    super.initState();
    this.getCurrentUser();
  }

  void onSendHandler() {
    _store.collection('messages').add({
      "text": this.messageValue,
      "sender": this.currentUser.email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, LoginScreenRoute);
              }),
        ],
        title: Text("⚡️Chat"),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
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
                      color: kAccentColor,
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
