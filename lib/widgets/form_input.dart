import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flash_chat/utils/debouncer.dart";
import "package:flash_chat/utils/theme.dart";

class FormInput extends StatefulWidget {
  final Function onChanged;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool isCentered;

  FormInput({
    @required this.onChanged,
    this.hint,
    this.obscureText,
    this.isCentered,
    this.keyboardType,
  });

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  bool valueVisible;
  final _debouncer = Debouncer(delay: Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    if (this.widget.obscureText != null && this.widget.obscureText == true) {
      this.valueVisible = false;
    } else {
      this.valueVisible = true;
    }
  }

  void onTextChange(String value) {
    _debouncer.run(() => this.widget.onChanged(value));
  }

  Widget renderVisibilityToggler() {
    if (this.widget.obscureText != null && this.widget.obscureText == true) {
      return IconButton(
        icon: Icon(this.valueVisible ? Icons.visibility_off : Icons.visibility,
            color: kDarkColor),
        onPressed: () {
          this.setState(() {
            this.valueVisible = !this.valueVisible;
          });
        },
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: this.widget.keyboardType ?? TextInputType.text,
      textAlign:
          this.widget.isCentered != null && this.widget.isCentered == true
              ? TextAlign.center
              : TextAlign.left,
      onChanged: this.onTextChange,
      style: kFormInputStyle,
      decoration: kFormInputDecoration.copyWith(
        hintText: this.widget.hint,
        suffixIcon: this.renderVisibilityToggler(),
      ),
      obscureText: !this.valueVisible,
    );
  }
}
