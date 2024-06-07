import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import '../../utils/style/style.dart';
import '../../utils/values/app_constant.dart';
import '../../utils/color/app_color.dart';
import 'package:intl/intl.dart';

class ProductDetails extends StatelessWidget {
  String imageLink, salePrice, price, description;
  double totalSales;
  double rating;
  bool showRating;
  ProductDetails(
      {super.key,
      required this.imageLink,
      required this.salePrice,
      required this.price,
      required this.description,
      required this.totalSales,
      required this.showRating,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // .network(imageLink),
            FadeInImage(
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(AppConstant.dokanLogoPath,height: 150,);
              },
                placeholder: AssetImage(AppConstant.dokanLogoPath),
                image: NetworkImage(imageLink)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Bidi.stripHtmlIfNeeded(description),
                  maxLines: 2,
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$$price',
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '\$$salePrice',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
                Visibility(
                  visible: showRating,
                  child: AnimatedRatingStars(
                    initialRating: rating,
                    minRating: 0.0,
                    maxRating: 5.0,
                    filledColor: Colors.amber,
                    emptyColor: Colors.grey,
                    filledIcon: Icons.star,
                    halfFilledIcon: Icons.star_half,
                    emptyIcon: Icons.star_border,
                    onChanged: (double rating) {
                      // Handle the rating change here
                      print('Rating: $rating');
                    },
                    displayRatingValue: true,
                    interactiveTooltips: true,
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border,
                    starSize: 10.0,
                    animationDuration: Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    readOnly: false,
                  ),
                ),
                Visibility(
                  visible: !showRating,
                  child: Text('$totalSales sold',style: AppStyle.styleNormalOsloGrey15,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
