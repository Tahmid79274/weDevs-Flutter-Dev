import 'package:flutter/material.dart';
import 'package:wedevs_flutter_dev/utils/style/style.dart';

import '../../utils/color/app_color.dart';
import '../../utils/string/string.dart';
class CustomButton extends StatelessWidget {
  VoidCallback onTapAction;
  String content;
  CustomButton({super.key,required this.content,required this.onTapAction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTapAction, child: Text(content,style: AppStyle.styleNormalWhite25,),
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.carnation),
        minimumSize: WidgetStateProperty.all(Size(MediaQuery.of(context).size.width * 0.8, 50)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)))
    ),
    );
  }
}
