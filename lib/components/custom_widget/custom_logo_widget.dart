import 'package:flutter/material.dart';

import '../../utils/values/app_constant.dart';
class CustomLogoWidget extends StatelessWidget {
  String imagePath;
  double width;
  CustomLogoWidget({super.key,required this.imagePath,required this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath,width: width,height: 120,);
  }
}
