import "package:flutter/material.dart";
import "package:flash_chat/utils/router.dart";
import "package:flash_chat/utils/constants.dart";
import "package:flash_chat/widgets/action_button.dart";

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation anim;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    anim = ColorTween(
      begin: kDarkColor,
      end: kLightColor,
    ).animate(animController);

    animController.forward();

    animController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anim.value,
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
                    height: kSizeHuge,
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
