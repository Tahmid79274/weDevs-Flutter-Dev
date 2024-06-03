import 'package:flutter/material.dart';

import '../custom_view/customBoxShadowTextField.dart';

class CustomSocialMediaButton extends StatelessWidget {
  VoidCallback tap;
  String path;
  CustomSocialMediaButton({super.key,required this.path,required this.tap});

  @override
  Widget build(BuildContext context) {
    return CustomBoxShadowTextField(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: tap,
          child: Image.asset(path,height: 25,),
        ),
      ),
    );
  }
}
