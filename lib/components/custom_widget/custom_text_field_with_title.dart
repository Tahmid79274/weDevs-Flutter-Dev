import 'package:flutter/material.dart';
import 'package:wedevs_flutter_dev/utils/values/app_constant.dart';

import '../../utils/color/app_color.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  TextEditingController controller;
  String label,hint;
  TextInputType inputType;
  CustomTextFieldWithTitle({super.key,required this.controller,required this.label,required this.hint,required this.inputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(color: AppColors.outerSpace),),
        SizedBox(height: AppConstant.size10 ,),
        TextFormField(
          keyboardType: inputType,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.outerSpace),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.regentGray.withOpacity(0.1))
            )
          ),
        ),
        SizedBox(height: AppConstant.size10 ,),
      ],
    );
  }
}
