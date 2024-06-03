import 'package:flutter/material.dart';

class CustomIconView extends StatelessWidget {
  String imagePath;
  CustomIconView({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(imagePath, width: 5, ),
    );
  }
}
