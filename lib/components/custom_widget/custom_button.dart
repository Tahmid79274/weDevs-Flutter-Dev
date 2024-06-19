import 'package:flutter/material.dart';
import 'package:wedevs_flutter_dev/utils/style/style.dart';

import '../../utils/color/app_color.dart';
import '../../utils/string/string.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onTapAction;
  String content;
  double width;
  Color backgroundColor, borderColor;
  TextStyle contentStyle;
  CustomButton(
      {super.key,
      required this.content,
      required this.width,
      required this.onTapAction,
      required this.backgroundColor,
      required this.borderColor,
      required this.contentStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapAction,
      child: Text(
        content,
        style: contentStyle,
      ),
      style: ButtonStyle(
          side: WidgetStateProperty.all(BorderSide(color: borderColor)),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width * width, 50)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
    );
  }
}
