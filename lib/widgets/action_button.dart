import 'package:flash_chat/utils/theme.dart';
import "package:flutter/material.dart";

const _kElevation = 6.0;
const _kRadius = 8.0;
const _kTextSize = 20.0;

class ActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color color;
  final Function onPressed;
  final bool isSmall;
  final bool isLoading;

  ActionButton({
    @required this.text,
    @required this.onPressed,
    this.backgroundColor,
    this.color,
    this.isSmall,
    this.isLoading,
  });

  Widget renderChild() {
    if (this.isLoading != null && this.isLoading) {
      return Container(
        width: _kTextSize,
        height: _kTextSize,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(kLightColor),
        ),
      );
    }

    return Text(
      this.text,
      style: TextStyle(
        color: this.color ?? kLightColor,
        fontSize: _kTextSize,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: _kElevation,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(_kRadius)),
      fillColor: this.backgroundColor ?? kGreyColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: this.renderChild(),
      ),
      onPressed: this.onPressed,
    );
  }
}
