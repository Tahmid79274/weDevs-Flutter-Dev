import 'package:flutter/material.dart';
import 'package:wedevs_flutter_dev/components/custom_view/customBoxShadowTextField.dart';
import 'package:wedevs_flutter_dev/components/custom_widget/custom_logo_widget.dart';
import 'package:wedevs_flutter_dev/utils/color/app_color.dart';
import 'package:wedevs_flutter_dev/utils/style/style.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import '../../utils/string/string.dart';
import '../../utils/values/app_constant.dart';
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(AppString.productListPlainText,
          style: AppStyle.styleBoldPortGore,),
        actions: [
          Icon(Icons.search,color: AppColors.portGore,)
        ],
      ),
      body: Column(
        children: [
          filterSection(),
          productListSection(),
        ],
      ),
    );
  }

  Widget filterSection(){
    return CustomBoxShadow(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomLogoWidget(imagePath: AppConstant.filterLogoPath, width: AppConstant.size20),
              SizedBox(width: AppConstant.size10,),
              Text(AppString.filterPlainText,style: AppStyle.styleNormalOsloGrey20,),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppString.sortByPlainText,style: AppStyle.styleNormalOsloGrey20,),
              SizedBox(width: AppConstant.size10,),
              Icon(Icons.keyboard_arrow_down,color: AppColors.osloGrey,),
              SizedBox(width: AppConstant.size20,),
              Icon(Icons.format_list_bulleted_outlined)
            ],
            ),
          ],
        ),
      ),
    );
  }

  Widget productListSection(){
    return GridView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    children: [
      Card(
        color: AppColors.osloGrey,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Image.network('https://static.wikia.nocookie.net/gotekken/images/1/19/Link_-_Super_Smash_Bros._Ultimate.png/revision/latest/scale-to-width-down/1000?cb=20200803170049')),
            Padding(padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('A boy with Sword trying to protect his wife. He will figt with the dragon',maxLines: 2,overflow: TextOverflow.fade,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\$120'),
                      SizedBox(width: 10,),
                      Text('\$90',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Flexible(child: RatingStars(rating: 3.5, editable: false,))
                ],
              ),
            )
          ],
        ),
      ),
    ],
    );
  }

}
