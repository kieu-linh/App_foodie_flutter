import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/app_box_shadow.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    super.key,
    this.onPressed,
    Color? color,
    required this.text,
    this.textColor = AppColor.white,
    this.fontSize = 16.0,
    Color? borderColor,
    this.height = 48.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0),
    // this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
    BorderRadius? borderRadius,
  })  : color = color ?? AppColor.red.withOpacity(0.98),
        borderColor = borderColor ?? AppColor.red.withOpacity(0.98),
        borderRadius = borderRadius ?? BorderRadius.circular(10.0);

  AppElevatedButton.small({
    super.key,
    this.onPressed,
    Color? color,
    required this.text,
    this.textColor = AppColor.white,
    this.fontSize = 14.6,
    Color? borderColor,
    this.height = 38.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    // this.borderRadius = const BorderRadius.all(Radius.circular(8.6)),
    BorderRadius? borderRadius,
  })  : color = color ?? AppColor.red.withOpacity(0.98),
        borderColor = borderColor ?? AppColor.red.withOpacity(0.98),
        borderRadius = borderRadius ?? BorderRadius.circular(8.6);

  AppElevatedButton.outline({
    super.key,
    this.onPressed,
    Color? color,
    required this.text,
    this.textColor = AppColor.red,
    this.fontSize = 16.0,
    Color? borderColor,
    this.height = 48.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0),
    // this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
    BorderRadius? borderRadius,
  })  : color = color ?? AppColor.white.withOpacity(0.98),
        borderColor = borderColor ?? AppColor.red.withOpacity(0.98),
        borderRadius = borderRadius ?? BorderRadius.circular(10.0);

  AppElevatedButton.smallOutline({
    super.key,
    this.onPressed,
    Color? color,
    required this.text,
    this.textColor = AppColor.red,
    this.fontSize = 14.6,
    Color? borderColor,
    this.height = 38.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    // this.borderRadius = const BorderRadius.all(Radius.circular(8.6)),
    BorderRadius? borderRadius,
  })  : color = color ?? AppColor.white.withOpacity(0.98),
        borderColor = borderColor ?? AppColor.red.withOpacity(0.98),
        borderRadius = borderRadius ?? BorderRadius.circular(8.6);

  final Function()? onPressed;
  final Color color;
  final String text;
  final Color textColor;
  final double fontSize;
  final Color borderColor;
  final double height;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: padding,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: 1.2),
          borderRadius: borderRadius,
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
