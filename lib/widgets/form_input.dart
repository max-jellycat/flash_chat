import "package:flutter/material.dart";

import "../utils/constants.dart";

class FormInput extends StatelessWidget {
  final Function onChanged;
  final String hint;

  FormInput({this.onChanged, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => this.onChanged(value),
      style: kFormInputStyle,
      decoration: kFormInputDecoration.copyWith(
        hintText: this.hint,
      ),
    );
  }
}
