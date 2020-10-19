import "package:flash_chat/widgets/action_button.dart";
import "package:flutter/material.dart";
import 'package:flash_chat/utils/theme.dart';
import "package:flash_chat/widgets/form_input.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            Hero(
              tag: "logo",
              child: Container(
                height: 200.0,
                child: Image.asset("images/logo.png"),
              ),
            ),
            SizedBox(
              height: kSizeHuge,
            ),
            FormInput(
              onChanged: (value) => print(value),
              hint: "Enter your email",
            ),
            SizedBox(
              height: kSizeMedium,
            ),
            FormInput(
              onChanged: () {},
              hint: "Enter your password",
            ),
            SizedBox(
              height: kSizeLarge,
            ),
            ActionButton(
              onPressed: () {},
              backgroundColor: kPrimaryColor,
              text: "Log In",
            )
          ],
        ),
      ),
    );
  }
}
