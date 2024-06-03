import 'package:flutter/material.dart';
import '../../utils/color/app_color.dart';

class CustomBoxShadowTextField extends StatelessWidget {
  Widget child;
  CustomBoxShadowTextField({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.white, // Adjust background color
        // color: Colors.red, // Adjust background color
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 0.0, // Adjust shadow spread
            blurRadius: 5.0, // Adjust shadow blur
            offset: const Offset(0, 2), // Adjust shadow position (x, y)
          ),
        ],
      ),
      child: child,
    );
  }
}
