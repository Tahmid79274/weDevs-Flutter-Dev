import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/custom_widget/custom_button.dart';
import '../../components/custom_widget/custom_logo_widget.dart';
import '../../components/custom_widget/custom_text_field_with_title.dart';
import '../../utils/style/style.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../components/custom_view/custom_views.dart';
import '../../utils/color/app_color.dart';
import '../../utils/string/string.dart';
import '../../utils/values/app_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  bool showAccount = false;

  void showAccountFunctionality(){
    setState(() {
      showAccount = !showAccount;
      print('ShowAccount:$showAccount');
    });
  }
  @override
  void dispose(){
    emailController.dispose();
    fullNameController.dispose();
    streetAddressController.dispose();
    apartmentController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(child: initBuildUi(height,width)),
    );
  }

  Widget initBuildUi(double height,double width){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomViews.sizedBoxHeight(height*0.1),
            Text(AppString.myAccountPlainText,style: AppStyle.styleBoldPortGore30,),
            CustomViews.sizedBoxHeight(height*0.05),
            DottedBorder(
              borderType: BorderType.Circle,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              color: AppColors.cornflowerLilac,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(50),
                    color: AppColors.pastelPink,),
                ),
              ),
            ),
            CustomViews.sizedBoxHeight(height*0.05),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('John Smith',style: AppStyle.styleBold30,),
                Text('info@johnsmith.com',style: AppStyle.styleNormalEmperor20,),
              ],
            ),
            CustomViews.sizedBoxHeight(height*0.05),
            Card(
              color: AppColors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: showAccountFunctionality,
                        leading: CustomLogoWidget(
                          width: width*0.05,
                          imagePath: AppConstant.personLogoPath,
                        ),
                        title: Text(AppString.accountPlainText),
                        trailing: showAccount?Icon(Icons.keyboard_arrow_down,color: AppColors.regentGray):Icon(Icons.arrow_forward_ios,color: AppColors.regentGray,),
                      ),
                      Visibility(
                        visible: showAccount,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextFieldWithTitle(
                                inputType: TextInputType.emailAddress,
                                controller: emailController,label: AppString.emailPlainText,hint: AppString.exampleEmailPlainText,),
                              CustomTextFieldWithTitle(
                                inputType: TextInputType.text,
                                controller: fullNameController,label: AppString.fullNamePlainText,hint: AppString.exampleFullNamePlainText,),
                              CustomTextFieldWithTitle(
                                inputType: TextInputType.text,
                                controller: streetAddressController,label: AppString.streetAddressPlainText,hint: AppString.exampleStreetAddressPlainText,),
                              CustomTextFieldWithTitle(
                                inputType: TextInputType.text,
                                controller: apartmentController,label: AppString.apartmentPlainText,hint: AppString.exampleApartmentPlainText,),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                      width: width*0.3,
                                      child: CustomTextFieldWithTitle(
                                        inputType: TextInputType.number,
                                        controller: zipCodeController,label: AppString.zipCodePlainText,hint: AppString.exampleZipCodePlainText,)),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(content: AppString.cancelPlainText, width: 0.4,
                                      onTapAction: (){}, backgroundColor: AppColors.white,
                                      borderColor: AppColors.geyser,
                                      contentStyle: AppStyle.styleBoldOsloGrey20),
                                  SizedBox(width: AppConstant.size10,),
                                  CustomButton(content: AppString.savePlainText, width: 0.4,
                                    onTapAction: (){}, backgroundColor: AppColors.mountainMeadow,
                                    borderColor: AppColors.mountainMeadow,
                                    contentStyle: AppStyle.styleBoldWhite20,
                                    // contentStyle: TextStyle(
                                    //   color: AppColors.white,
                                    // )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  ListTile(
                    leading: CustomLogoWidget(
                      width: width*0.05,
                      imagePath: AppConstant.passwordLogoPath,
                    ),
                    title: Text(AppString.passwordPlainText),
                    trailing: Icon(Icons.arrow_forward_ios,color: AppColors.regentGray,),
                  ),
                  ListTile(
                    leading: CustomLogoWidget(
                      width: width*0.05,
                      imagePath: AppConstant.notificationLogoPath,
                    ),
                    title: Text(AppString.notificationPlainText),
                    trailing: Icon(Icons.arrow_forward_ios,color: AppColors.regentGray,),
                  ),
                  ListTile(
                    leading: CustomLogoWidget(
                      width: width*0.05,
                      imagePath: AppConstant.wishlistLogoPath,
                    ),
                    title: Text(AppString.wishlistPlainText),
                    trailing: Icon(Icons.arrow_forward_ios,color: AppColors.regentGray,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
