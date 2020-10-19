import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import "package:flash_chat/utils/router.dart";
import "package:flash_chat/screens/welcome_screen.dart";
import "package:flash_chat/screens/login_screen.dart";
import "package:flash_chat/screens/registration_screen.dart";
import "package:flash_chat/screens/chat_screen.dart";

void main() => runApp(FlashChat());

class FlashChat extends StatefulWidget {
  @override
  _FlashChatState createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  Future<void> initFirebase() async {
    FirebaseApp app = await Firebase.initializeApp();
    assert(app != null);
    print('Initialized default app $app');
  }

  @override
  void initState() {
    super.initState();
    this.initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: "SourceSansPro",
        ),
        initialRoute: WelcomeScreenRoute,
        routes: {
          WelcomeScreenRoute: (context) => WelcomeScreen(),
          LoginScreenRoute: (context) => LoginScreen(),
          RegisterScreenRoute: (context) => RegistrationScreen(),
          ChatScreenRoute: (context) => ChatScreen(),
        });
  }
}
