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

  ActionButton({
    @required this.text,
    @required this.onPressed,
    this.backgroundColor,
    this.color,
    this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: _kElevation,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(_kRadius)),
      fillColor: this.backgroundColor ?? kGreyColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          this.text,
          style: TextStyle(
            color: this.color ?? kLightColor,
            fontSize: _kTextSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
