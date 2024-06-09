import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wedevs_flutter_dev/network/service/service_api.dart';
import 'package:wedevs_flutter_dev/utils/shared_prefs_manager/shared_prefs_manager.dart';
import '../../components/custom_view/custom_loader.dart';
import '../../components/custom_view/custom_response_status.dart';
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
          onTapAction: ()async{
            CustomLoader.showLoader(context);
            String token = '';

            final Uri url = Uri.parse(ServiceApi.loginEndPoint);
            //print('Url:$url');
            final Map<String, String> body = {'username': emailController.text, 'password': passwordController.text};

            try {
              final response = await http.post(url, body: body, headers: {'Content-Type': 'application/x-www-form-urlencoded'});

              final data = jsonDecode(response.body);

              if (response.statusCode == 200) {

                token = data['token']; // Assuming 'token' is the key for the auth token
                // You can store the token securely using flutter_secure_storage (optional)
                print('Token:$token');
                SharedPrefsManager.setToken(token);
              } else {
                // Handle unsuccessful login (e.g., wrong credentials, server error)
                print('Login failed: ${response.statusCode}');
                print('Login failed: ${response.body}');
                String message = data['code'].toString().split(' ').last.replaceAll('_', ' ');
                CustomResponseStatus.showResponseStatus(context, message, AppColors.carnation);
              }
            } catch (error) {
              // Handle exceptions (e.g., network issues)
              print('Login error: $error');
            }
            CustomLoader.removeLoader(context);
            if(token!=''){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BaseScreen()),);
            }
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
