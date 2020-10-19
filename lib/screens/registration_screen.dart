import "package:flash_chat/widgets/form_input.dart";
import "package:flutter/material.dart";
import "package:flash_chat/utils/constants.dart";
import "package:flash_chat/widgets/action_button.dart";

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              onChanged: (value) {},
              hint: "Enter your email",
            ),
            SizedBox(
              height: kSizeMedium,
            ),
            FormInput(
              onChanged: (value) {},
              hint: "Enter your password",
            ),
            SizedBox(
              height: kSizeLarge,
            ),
            ActionButton(
              onPressed: () {},
              backgroundColor: kAccentColor,
              color: kLightColor,
              text: "Register",
            )
          ],
        ),
      ),
    );
  }
}
