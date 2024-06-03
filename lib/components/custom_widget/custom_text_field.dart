import 'package:flutter/material.dart';
import 'package:wedevs_flutter_dev/utils/color/app_color.dart';
import 'package:wedevs_flutter_dev/utils/style/style.dart';
import 'package:wedevs_flutter_dev/utils/values/app_constant.dart';
import '../custom_view/customBoxShadowTextField.dart';
import '../custom_view/custom_icon_view.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hint,imagePath;
  CustomTextField({super.key,required this.controller,required this.hint,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CustomBoxShadowTextField(
      child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppConstant.emailLogoPath, width: 5, ),
          ),
          // prefix: Image.asset(AppConstant.emailLogoPath,color: Colors.red,width: 20,),
          // prefixIconColor: Colors.red,
          hintText: hint,
          hintStyle: AppStyle.styleNormalSlateGray25,
          border: InputBorder.none
      ),
    ),
    );
  }
}


class CustomPasswordField extends StatelessWidget {
  TextEditingController controller;
  String hint,imagePath;
  IconData icon;
  VoidCallback showPasswordFunction;
  CustomPasswordField({super.key,required this.controller,required this.hint,required this.imagePath,required this.icon,required this.showPasswordFunction});

  @override
  Widget build(BuildContext context) {
    return CustomBoxShadowTextField(
      child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: CustomIconView(
            imagePath: AppConstant.emailLogoPath,
          ),
          suffixIcon: Icon(icon),
          // prefix: Image.asset(AppConstant.emailLogoPath,color: Colors.red,width: 20,),
          // prefixIconColor: Colors.red,
          hintText: hint,
          hintStyle: AppStyle.styleNormalSlateGray25,
          border: InputBorder.none
      ),
    ),
    );
  }
}
