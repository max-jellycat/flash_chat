import "package:flutter/material.dart";
import "package:flash_chat/utils/router.dart";
import "package:flash_chat/utils/constants.dart";
import "package:flash_chat/widgets/action_button.dart";

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset("images/logo.png"),
                    height: kSizeUber,
                  ),
                ),
                Text(
                  "Flash Chat",
                  style: TextStyle(
                    fontSize: kSizeHuge,
                    fontWeight: FontWeight.w900,
                    color: kDarkColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kSizeHuge,
            ),
            ActionButton(
              text: "Log in",
              backgroundColor: kPrimaryColor,
              color: kLightColor,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreenRoute);
              },
            ),
            SizedBox(
              height: kSizeLarge,
            ),
            ActionButton(
              text: "Register",
              backgroundColor: kGreyColor,
              color: kLightColor,
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
