import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flash_chat/utils/debouncer.dart';

import '../utils/theme.dart';

class FormInput extends StatelessWidget {
  final Function onChanged;
  final String hint;

  final _debouncer = Debouncer(delay: Duration(milliseconds: 500));

  FormInput({this.onChanged, this.hint});

  void onTextChange(String value) {
    _debouncer.run(() => this.onChanged(value));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: this.onTextChange,
      style: kFormInputStyle,
      decoration: kFormInputDecoration.copyWith(
        hintText: this.hint,
      ),
    );
  }
}
