import 'package:flutter/material.dart';

import '../../utils/values/app_constant.dart';
class CustomLogoWidget extends StatelessWidget {
  const CustomLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppConstant.dokanLogoPath,width: 200);
  }
}
