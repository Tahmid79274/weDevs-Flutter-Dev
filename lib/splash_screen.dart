import 'package:flutter/material.dart';
import './screens/home/products_screen.dart';
import './components/custom_widget/custom_logo_widget.dart';
import './utils/color/app_color.dart';
import './screens/auth/sign_in_screen.dart';
import 'utils/shared_prefs_manager/shared_prefs_manager.dart';
import 'utils/values/app_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      String token = await SharedPrefsManager.getToken();
      if(token.isEmpty){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      }
      else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProductsScreen()),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CustomLogoWidget(
            width: AppConstant.size200,
            imagePath: AppConstant.dokanLogoPath,
          ),
        ),
      ),
    );
  }
}
