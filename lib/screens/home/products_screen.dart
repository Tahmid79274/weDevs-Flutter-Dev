import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/custom_widget/custom_button.dart';
import '../../components/custom_view/customBoxShadowTextField.dart';
import '../../components/custom_widget/custom_checkbox.dart';
import '../../components/custom_widget/custom_logo_widget.dart';
import '../../data/products/model/product_model.dart';
import '../../utils/color/app_color.dart';
import '../../utils/style/style.dart';
import '../../components/custom_widget/product_details.dart';
import '../../utils/string/string.dart';
import '../../utils/values/app_constant.dart';
import 'dart:convert';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isNewest = false;
  bool isOldest = false;
  bool isLow = false;
  bool isHigh = false;
  bool isBestSelling = false;

  List<ProductModel> products = [];
  late Future<List<ProductModel>> getProducts;

  Future<List<ProductModel>> getFilteredProductList() async {
    List<ProductModel> filteredProducts = products;
    if(isNewest){
      filteredProducts.sort((a, b) => a.dateCreated.compareTo(b.dateCreated),);
    }
    else if(isOldest){
      filteredProducts.sort((a, b) => b.dateCreated.compareTo(a.dateCreated),);
    }
    else if(isLow){
      filteredProducts.sort((a,b)=> b.salePrice.compareTo(a.salePrice));
    }
    else if(isHigh){
      filteredProducts.sort((a,b)=> a.salePrice.compareTo(b.salePrice));
    }
    else if(isBestSelling){
      filteredProducts.sort((a,b)=> b.totalSales.compareTo(a.totalSales));
    }
    return filteredProducts;
  }
  Future<List<ProductModel>> getProductList() async{
    String jsonString = await rootBundle.loadString(AppConstant.productJsonPath);
    List<dynamic> jsonData = jsonDecode(jsonString);
    products.clear();
    for (int i = 0; i < jsonData.length; i++) {
      products.add(ProductModel(
          id: jsonData[i]['id'].toString(),
          name: jsonData[i]['name'].toString(),
          slug: jsonData[i]['slug'].toString(),
          dateCreated:  DateTime.parse(jsonData[i]['date_created'].toString()),
          shortDescription: jsonData[i]['short_description'].toString(),
          totalSales: jsonData[i]['total_sales'].toString(),
          imageLink: jsonData[i]['images'][0]['src'].toString(),
          rating: jsonData[i]['average_rating'].toString(),
          regularPrice: jsonData[i]['regular_price'].toString(),
          salePrice: jsonData[i]['sale_price'].toString()));
      DateTime date = DateTime.parse(jsonData[i]['date_created']);
      print('${jsonData[i]['name']} has purchased at  $date');
    }
    //products.sort((a,b) => a.dateCreated.compareTo(b.dateCreated) );
    return products;
  }

  @override
  void initState(){
    super.initState();
    getProducts = getProductList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          AppString.productListPlainText,
          style: AppStyle.styleBoldPortGore,
        ),
        actions: [
          Icon(
            Icons.search,
            color: AppColors.portGore,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            filterSection(),
            productListSection(),
          ],
        ),
      ),
    );
  }

  Widget filterSection() {
    return CustomBoxShadow(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            backgroundColor: AppColors.white,
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 150,
                      endIndent: 150,
                      color: AppColors.pastelPink,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 10,
                          width: 15,
                        ),
                        Text(
                          AppString.filterPlainText,
                          style: AppStyle.styleBoldBlack20,),
                      ],
                    ),
                    CustomCheckbox(
                      value: isNewest,
                      content: AppString.newestPlainText,
                      onChangedAction: (p0) {
                        setState((){
                          isNewest=p0!;
                        });
                      },
                    ),
                    CustomCheckbox(
                      value: isOldest,
                      content: AppString.oldestPlainText,
                      onChangedAction: (p0) {
                        setState((){
                          isOldest=p0!;
                        });
                      },
                    ),
                    CustomCheckbox(
                      value: isLow,
                      content: AppString.lowToHighPlainText,
                      onChangedAction: (p0) {
                        setState((){
                          isLow=p0!;
                        });
                      },
                    ),
                    CustomCheckbox(
                      value: isHigh,
                      content: AppString.highToLowPlainText,
                      onChangedAction: (p0) {
                        setState((){
                          isHigh=p0!;
                        });
                      },
                    ),
                    CustomCheckbox(
                      value: isBestSelling,
                      content: AppString.bestSellingPlainText,
                      onChangedAction: (p0) {
                        print('p0:$p0');
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(content: AppString.cancelPlainText, width: 0.45,
                              onTapAction: (){
                            Navigator.of(context,rootNavigator: true).pop();
                              }, backgroundColor: AppColors.white,
                              borderColor: AppColors.geyser,
                              contentStyle: AppStyle.styleNormalOsloGrey20),
                          SizedBox(width: AppConstant.size10,),
                          CustomButton(content: AppString.applyPlainText, width: 0.45,
                              onTapAction: (){
                                Navigator.of(context,rootNavigator: true).pop();
                            setState((){
                              getProducts = getFilteredProductList();
                            });
                              }, backgroundColor: AppColors.mountainMeadow,
                              borderColor: AppColors.mountainMeadow,
                            contentStyle: AppStyle.styleNormalWhite20,
                            // contentStyle: TextStyle(
                              //   color: AppColors.white,
                              // )
                          ),
                        ],
                      ),
                    ),SizedBox(height: 10,)
                  ],
                );
              },);
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomLogoWidget(
                      imagePath: AppConstant.filterLogoPath,
                      width: AppConstant.size20),
                  SizedBox(
                    width: AppConstant.size10,
                  ),
                  Text(
                    AppString.filterPlainText,
                    style: AppStyle.styleNormalOsloGrey20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppString.sortByPlainText,
                    style: AppStyle.styleNormalOsloGrey20,
                  ),
                  SizedBox(
                    width: AppConstant.size10,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.osloGrey,
                  ),
                  SizedBox(
                    width: AppConstant.size20,
                  ),
                  Icon(Icons.format_list_bulleted_outlined)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productListSection() {
    return FutureBuilder<List<ProductModel>>(future: getProducts,
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: AppColors.carnation,
            ),);
          }else if(snapshot.hasError){
            return Center(child: Text('No Data Found'),);
          }else{
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ProductDetails(
                  description: snapshot.data![index].shortDescription,
                  imageLink: snapshot.data![index].imageLink,
                  price: snapshot.data![index].regularPrice,
                  rating: double.parse(snapshot.data![index].rating),
                  salePrice: snapshot.data![index].salePrice,
                  totalSales: double.parse(snapshot.data![index].totalSales),
                  showRating: snapshot.data![index].showRating,
                );
              },
              padding: EdgeInsets.symmetric(horizontal: 4),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 2, childAspectRatio: 0.65),
            );
          }
        },);
  }
}
