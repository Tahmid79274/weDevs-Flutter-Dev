import 'package:flutter/material.dart';
import '../../utils/style/style.dart';

class CustomResponseStatus {
  static void showResponseStatus(
      BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(
      content: Text(
        message,
        style: AppStyle.styleNormalWhite25,
      ),
      backgroundColor: backgroundColor,
    ));
  }
}
