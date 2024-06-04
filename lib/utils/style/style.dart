
import 'package:flutter/material.dart';
import '../color/app_color.dart';
import '../values/app_constant.dart';

abstract class AppStyle{
  static const TextStyle styleBold30 = TextStyle(fontWeight: FontWeight.bold,fontSize: AppConstant.size30);
  static const TextStyle styleNormalSlateGray25 = TextStyle(fontWeight: FontWeight.normal, color: AppColors.slateGray, fontSize: AppConstant.size25);
  static const TextStyle styleNormalSlateGray15 = TextStyle(fontWeight: FontWeight.normal, color: AppColors.slateGray, fontSize: AppConstant.size15);
  static const TextStyle styleNormalWhite25 = TextStyle(fontWeight: FontWeight.normal, color: AppColors.white, fontSize: AppConstant.size25);
  static const TextStyle styleNormalOuterSpace20 = TextStyle(fontWeight: FontWeight.normal,color: AppColors.outerSpace,fontSize: AppConstant.size20,);
  static const TextStyle styleBoldCurious20 = TextStyle(fontWeight: FontWeight.bold,color: AppColors.curiousBlue,fontSize: AppConstant.size20,);
}