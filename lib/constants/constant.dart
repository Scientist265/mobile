import 'package:flutter/material.dart';

const logoColor = Color(0xff2EBA64);

const primaryStyle = TextStyle(
  fontSize: 18,
  color: logoColor,
  fontWeight: FontWeight.w600,
);

const logoText = Text(
  'PathEd',
  style: TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: Color(0xFF2EBA64),
  ),
);

const secondaryTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const defaultPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0);

final pathedLogo = Image.asset(
  'assets/images/logo_green.png',
  width: 164,
  height: 96,
);
