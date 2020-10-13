import 'package:flutter/material.dart';
import 'package:flash_chat/widgets/action_button.dart';
import 'package:flash_chat/utils/constants.dart';

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
                Container(
                  child: Image.asset('images/logo.png'),
                  height: kSizeUber,
                ),
                Text(
                  'Flash Chat',
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
              text: 'Log in',
              backgroundColor: kPrimaryColor,
              color: kLightColor,
              onPressed: () {},
            ),
            SizedBox(
              height: kSizeLarge,
            ),
            ActionButton(
              text: 'Register',
              backgroundColor: kGreyColor,
              color: kLightColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
