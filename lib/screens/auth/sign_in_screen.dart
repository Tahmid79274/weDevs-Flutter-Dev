import 'package:flutter/material.dart';
import './sign_up_screen.dart';
import '../../components/custom_widget/custom_button.dart';
import '../../components/custom_widget/custom_social_media_button.dart';
import '../../utils/string/string.dart';
import '../../utils/style/style.dart';
import '../../utils/color/app_color.dart';
import '../../components/custom_widget/custom_logo_widget.dart';
import '../../components/custom_widget/custom_text_field.dart';
import '../../utils/values/app_constant.dart';
import '../home/base_screen.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool showPass = false;
  void showPasswordOrNot(){
    setState(() {
      showPass=!showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // backgroundColor: Colors.red,
      body: initBuildUi(),
    );
  }

  Widget initBuildUi() {
    return SizedBox(
      // color: Colors.green,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        // direction: Axis.vertical,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          CustomLogoWidget(
            width: AppConstant.size200,
            imagePath: AppConstant.dokanLogoPath,
          ),
          SizedBox(
            height: 20,
          ),
          authenticationSection(),
          socialAuthenticationSection(),
          createNewAccountSection(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget authenticationSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppString.signInPlainText,
          style: AppStyle.styleBold30,
        ),
        SizedBox(
          height: AppConstant.size15,
        ),
        CustomTextField(
          controller: emailController,
          hint: AppString.emailPlainText,
          imagePath: AppConstant.emailLogoPath,
        ),
        CustomPasswordField(
          controller: passwordController,
          hint: AppString.passwordPlainText,
          imagePath: AppConstant.passwordLogoPath,
          icon: showPass?Icons.visibility_off:Icons.visibility,
          showPasswordText: !showPass,
          showPasswordFunction: showPasswordOrNot,
        ),
        Align(
            alignment: Alignment.topRight,
            child: TextButton(onPressed: (){}, child: Text(AppString.forgotPasswordPlainText,style: AppStyle.styleNormalSlateGray15,))),
        SizedBox(
          height: AppConstant.size25,
        ),
        CustomButton(
          content: AppString.logInPlainText,
          onTapAction: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BaseScreen()),);
        },),
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

  Widget createNewAccountSection(){
    return TextButton(onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
    }, child: Text(AppString.createNewAccountPlainText,style: AppStyle.styleNormalOuterSpace20,));
  }
}
