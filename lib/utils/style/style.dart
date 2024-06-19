
import 'package:flutter/material.dart';
import '../color/app_color.dart';
import '../values/app_constant.dart';

abstract class AppStyle{
  static const TextStyle styleBold30 = TextStyle(fontWeight: FontWeight.bold,fontSize: AppConstant.size30);
  static const TextStyle styleNormalSlateGray25 = TextStyle(fontWeight: FontWeight.normal, color: AppColors.slateGray, fontSize: AppConstant.size25);
  static const TextStyle styleNormalSlateGray15 = TextStyle(fontWeight: FontWeight.normal, color: AppColors.slateGray, fontSize: AppConstant.size15);
  static const TextStyle styleNormalWhite25 = TextStyle(fontWeight: FontWeight.normal, color: AppColors.white, fontSize: AppConstant.size25);
  static const TextStyle styleNormalWhite20 = TextStyle(fontWeight: FontWeight.normal, color: AppColors.white, fontSize: AppConstant.size20);
  static const TextStyle styleBoldWhite20 = TextStyle(fontWeight: FontWeight.bold, color: AppColors.white, fontSize: AppConstant.size20);
  static const TextStyle styleNormalOuterSpace20 = TextStyle(fontWeight: FontWeight.normal,color: AppColors.outerSpace,fontSize: AppConstant.size20,);
  static const TextStyle styleBoldCurious20 = TextStyle(fontWeight: FontWeight.bold,color: AppColors.curiousBlue,fontSize: AppConstant.size20,);
  static const TextStyle styleBoldPortGore = TextStyle(fontWeight: FontWeight.bold, color: AppColors.portGore);
  static const TextStyle styleBoldPortGore30 = TextStyle(fontWeight: FontWeight.bold, color: AppColors.portGore,fontSize: AppConstant.size30);
  static const TextStyle styleNormalOsloGrey20 = TextStyle(fontWeight: FontWeight.normal,color: AppColors.osloGrey,fontSize: AppConstant.size20);
  static const TextStyle styleBoldOsloGrey20 = TextStyle(fontWeight: FontWeight.bold,color: AppColors.osloGrey,fontSize: AppConstant.size20);
  static const TextStyle styleNormalEmperor20 = TextStyle(fontWeight: FontWeight.normal,color: AppColors.emperor,fontSize: AppConstant.size20);
  static const TextStyle styleBoldBlack20 = TextStyle(
      fontSize: AppConstant.size20,
      fontWeight: FontWeight.bold,
      color: AppColors.black);
  static const TextStyle styleNormalOsloGrey15 = TextStyle(
      fontSize: AppConstant.size15,
      fontWeight: FontWeight.normal,
      color: AppColors.osloGrey);
}