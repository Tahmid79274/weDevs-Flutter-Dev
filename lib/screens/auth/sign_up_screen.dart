import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedevs_flutter_dev/components/custom_widget/custom_button.dart';
import 'package:wedevs_flutter_dev/utils/string/string.dart';
import 'package:wedevs_flutter_dev/utils/style/style.dart';
import 'package:wedevs_flutter_dev/utils/values/app_constant.dart';

import '../../components/custom_view/customBoxShadowTextField.dart';
import '../../components/custom_widget/custom_logo_widget.dart';
import '../../components/custom_widget/custom_social_media_button.dart';
import '../../components/custom_widget/custom_text_field.dart';
import '../../utils/color/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool showPass = false;
  bool confirmShowPass = false;
  void showPasswordOrNot(){
    setState(() {
      showPass=!showPass;
    });
  }

  void showConfirmPasswordOrNot(){
    setState(() {
      confirmShowPass=!confirmShowPass;
    });
  }

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          uploadImageSection(),
          SizedBox(height: 30,),
          createAccountSection(),
          SizedBox(height: 20,),
          socialAuthenticationSection(),
          SizedBox(height: 10,),
          alreadyHaveAnAccountSection(),
          SizedBox(height: 30,),
        ],
      ),
    );
  }

  Widget uploadImageSection(){
    return CustomCircleBoxShadow(
      child: Stack(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.bottomRight,
          fit: StackFit.passthrough,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomLogoWidget(
                // width: AppConstant.size100,
                width: 100,
                imagePath: AppConstant.personPath,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30,),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.carnation
              ),
              child: IconButton(onPressed: (){},padding: EdgeInsets.zero,
                  icon: Icon(Icons.camera_alt,color: Colors.white,)),
            )
          ]
      ),);
  }

  Widget createAccountSection(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment,
      children: [
        CustomTextField(
          imagePath: AppConstant.personPath,
          hint: AppString.namePlainText,
          controller: nameController,
        ),
        CustomTextField(
          imagePath: AppConstant.emailLogoPath,
          hint: AppString.emailPlainText,
          controller: nameController,
        ),
        CustomPasswordField(
          controller: passwordController,
          hint: AppString.passwordPlainText,
          imagePath: AppConstant.passwordLogoPath,
          icon: showPass?Icons.visibility_off:Icons.visibility,
          showPasswordText: !showPass,
          showPasswordFunction: showPasswordOrNot,
        ),
        CustomPasswordField(
          controller: confirmPasswordController,
          hint: AppString.confirmPasswordPlainText,
          imagePath: AppConstant.passwordLogoPath,
          icon: confirmShowPass?Icons.visibility_off:Icons.visibility,
          showPasswordText: !confirmShowPass,
          showPasswordFunction: showConfirmPasswordOrNot,
        ),
        SizedBox(height: 30,),
        CustomButton(
            content: AppString.signUpPlainText,
            onTapAction: (){}),
      ],
    );
  }

  Widget socialAuthenticationSection(){
    return Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialMediaButton(path: AppConstant.fbLogoPath,tap: (){},),
        CustomSocialMediaButton(path: AppConstant.googleLogoPath,tap: (){},),
      ],
    );
  }

  Widget alreadyHaveAnAccountSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppString.alreadyHaveAnAccountPlainText,style: AppStyle.styleNormalOuterSpace20,),
        SizedBox(width: AppConstant.size10,),
        TextButton(onPressed: (){}, child: Text(AppString.logInPlainText,style: AppStyle.styleBoldCurious20,)),
      ],
    );
  }
}
