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

  void onSendHandler() {
    _store.collection('messages').add({
      "text": this.messageValue,
      "sender": this.currentUser.email,
    });

    setState(() {
      this.messageValue = "";
    });
  }

  void onLogoutHandler() {
    _auth.signOut();
    Navigator.pushNamed(context, LoginScreenRoute);
  }

  Widget renderMessages(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
      final widget = Text(
        "$text ($sender)",
        style: TextStyle(
          fontSize: kSizeHuge,
        ),
      );
      messagesWidgets.add(widget);
    }

    return Expanded(
      child: ListView(
        children: messagesWidgets,
      ),
    );
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
        title: Text("⚡️Chat"),
        backgroundColor: kAccentColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _store.collection("messages").snapshots(),
              builder: (context, snapshot) =>
                  this.renderMessages(context, snapshot),
            ),
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
