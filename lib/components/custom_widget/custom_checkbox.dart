import 'package:flutter/material.dart';
import '../../utils/color/app_color.dart';
class CustomCheckbox extends StatelessWidget {
  bool value;
  String content;
  Function(bool?) onChangedAction;
  CustomCheckbox({super.key,required this.content,required this.value, required this.onChangedAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          activeColor: AppColors.carnation,
          side: BorderSide(color: AppColors.carnation),
          onChanged: onChangedAction,
          value: value,
          shape: RoundedRectangleBorder(side: BorderSide(color: AppColors.carnation),borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        // SizedBox(width: 5,),
        Text(content,style: TextStyle(color: AppColors.black,fontSize: 20),)
      ],
    );
  }
}
