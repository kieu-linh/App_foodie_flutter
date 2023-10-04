import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';

class AppBoxShadow {
  AppBoxShadow._();

  static const boxShadow = [
    BoxShadow(
      color: AppColor.shadow,
      offset: Offset(0.0, 3.0),
      blurRadius: 6.0,
    ),
  ];
}
