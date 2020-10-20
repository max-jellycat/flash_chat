import "package:flutter/material.dart";

const kPrimaryColor = Color(0xFFF1C40F);
const kAccentColor = Color(0xFF3498DB);
const kLightColor = Color(0xFFECF0F1);
const kGreyColor = Color(0xFF95A5A6);
const kDarkColor = Color(0xFF2C3E50);

const kSizeTiny = 4.0;
const kSizeSmall = 8.0;
const kSizeMedium = 16.0;
const kSizeLarge = 24.0;
const kSizeLarger = 32.0;
const kSizeHuge = 48.0;
const kSizeUber = 64.0;

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(kSizeMedium),
  hintText: "Type your message here...",
  hintStyle: TextStyle(
    color: kGreyColor,
  ),
  border: InputBorder.none,
);

const kMessageTextFieldStyle = TextStyle(
  color: kDarkColor,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kPrimaryColor, width: 2.0),
  ),
);

const kFormInputStyle = TextStyle(
  fontSize: kSizeMedium,
  color: kDarkColor,
);

const kFormInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(kSizeMedium),
  hintStyle: TextStyle(
    fontSize: kSizeMedium,
    color: kGreyColor,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kSizeSmall)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kSizeSmall)),
    borderSide: BorderSide(
      color: kDarkColor,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kSizeSmall)),
    borderSide: BorderSide(
      color: kAccentColor,
      width: 2.0,
    ),
  ),
);
