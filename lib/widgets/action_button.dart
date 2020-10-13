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
    this.backgroundColor,
    this.color,
    this.onPressed,
    this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: _kElevation,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(_kRadius)),
      fillColor: this.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          this.text,
          style: TextStyle(
            color: this.color,
            fontSize: _kTextSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
