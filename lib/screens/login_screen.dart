import "package:firebase_auth/firebase_auth.dart";
import "package:flash_chat/utils/router.dart";
import "package:flash_chat/widgets/action_button.dart";
import "package:flutter/material.dart";
import "package:flash_chat/utils/theme.dart";
import "package:flash_chat/widgets/form_input.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool isLoading = false;

  void onLoginHandler() async {
    setState(() {
      this.isLoading = true;
    });
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
        email: this.email,
        password: this.password,
      );

      if (newUser != null) {
        Navigator.pushNamed(context, ChatScreenRoute);
      }

      setState(() {
        this.isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: "logo",
                child: Container(
                  height: 200.0,
                  child: Image.asset("images/logo.png"),
                ),
              ),
            ),
            SizedBox(
              height: kSizeHuge,
            ),
            FormInput(
              onChanged: (value) {
                this.email = value;
              },
              hint: "Enter your email",
            ),
            SizedBox(
              height: kSizeMedium,
            ),
            FormInput(
              onChanged: (value) {
                this.password = value;
              },
              hint: "Enter your password",
              obscureText: true,
            ),
            SizedBox(
              height: kSizeLarge,
            ),
            ActionButton(
              onPressed: this.onLoginHandler,
              backgroundColor: kPrimaryColor,
              text: "Log In",
              isLoading: this.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
