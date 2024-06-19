import 'dart:convert';

import 'package:flutter/material.dart';
import '../../network/client/base_client.dart';
import '../../network/service/service_api.dart';
import '../../utils/shared_prefs_manager/shared_prefs_manager.dart';
import '../../components/custom_view/custom_loader.dart';
import '../../components/custom_view/custom_response_status.dart';
import '../../components/custom_view/custom_views.dart';
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
import 'package:http/http.dart' as http;
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      // backgroundColor: Colors.red,
      body: SingleChildScrollView(child: initBuildUi(height,width)),
    );
  }

  Widget initBuildUi(double height, double width) {
    return Column(
      // direction: Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomViews.sizedBoxHeight(height*0.1),
        CustomLogoWidget(
          width: AppConstant.size200,
          imagePath: AppConstant.dokanLogoPath,
        ),
        CustomViews.sizedBoxHeight(height*0.1),
        authenticationSection(),
        CustomViews.sizedBoxHeight(height*0.05),
        socialAuthenticationSection(),
        CustomViews.sizedBoxHeight(height*0.05),
        createNewAccountSection(),
        CustomViews.sizedBoxHeight(height*0.05),
      ],
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
          height: AppConstant.size30,
        ),
        CustomButton(
          content: AppString.logInPlainText,
          borderColor: AppColors.carnation,
          width: 0.8,
          backgroundColor: AppColors.carnation,
          contentStyle: AppStyle.styleNormalWhite25,
          onTapAction: loginFunction,),
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

  Future<void> loginFunction ()async{
    CustomLoader.showLoader(context);
    String token = '';

    final Map<String, String> body = {'username': emailController.text, 'password': passwordController.text};
    final Map<String, String> headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    try {
      final responseWithStatusCode = await BaseClient.postFunction(ServiceApi.loginEndPoint,body,headers);

      if(responseWithStatusCode != null){
        final data = jsonDecode(responseWithStatusCode.last);
        if(responseWithStatusCode.first == 200){
          token = data['token'];
          SharedPrefsManager.setToken(token);
        }
        else{
          String message = data['code'].toString().split(' ').last.replaceAll('_', ' ');
          CustomResponseStatus.showResponseStatus(context, message, AppColors.carnation);
        }
      }
      else{
        CustomResponseStatus.showResponseStatus(context, 'Something went wrong!!!', AppColors.carnation);
      }
    } catch (error) {
      // Handle exceptions (e.g., network issues)
      print('Login error: $error');
    }
    CustomLoader.removeLoader(context);
    if(token!=''){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BaseScreen()),);
    }
  }

}
