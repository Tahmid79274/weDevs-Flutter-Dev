import 'package:flutter/material.dart';

import '../../utils/color/app_color.dart';

class CustomLoader{

  static void showLoader(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) {
      return Center(child: CircularProgressIndicator(color: AppColors.carnation,),);
    },);
  }

  static void removeLoader(BuildContext context){
    Navigator.of(context).pop();
  }

}