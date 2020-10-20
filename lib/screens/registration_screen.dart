import "package:flash_chat/utils/router.dart";
import "package:flash_chat/widgets/form_input.dart";
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flash_chat/utils/theme.dart";
import "package:flash_chat/widgets/action_button.dart";

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool isLoading = false;

  void onRegisterHandler() async {
    setState(() {
      this.isLoading = true;
    });
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
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
        padding: EdgeInsets.symmetric(horizontal: kSizeLarge),
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
              keyboardType: TextInputType.emailAddress,
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
              onPressed: this.onRegisterHandler,
              backgroundColor: kAccentColor,
              text: "Register",
              isLoading: this.isLoading,
            )
          ],
        ),
      ),
    );
  }
}
