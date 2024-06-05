import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:wedevs_flutter_dev/utils/color/app_color.dart';

import 'products_screen.dart';
import 'profile_screen.dart';
import 'under_development_screen.dart';
class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initBuildUi(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.carnation,
        shape: CircleBorder(),
        child: Icon(
          Icons.search,
          color: AppColors.white,
        ),
        onPressed: () {
          // _fabAnimationController.reset();
          // _borderRadiusAnimationController.reset();
          // _borderRadiusAnimationController.forward();
          // _fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            Icons.home_outlined,
            Icons.grid_view_outlined,
            Icons.shopping_cart_outlined,
            Icons.person_outline,
          ],
          inactiveColor: AppColors.bermudaGray,
          activeColor: AppColors.hotPink,
          backgroundColor: AppColors.white,
          activeIndex: currentPageIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) => setState(() => currentPageIndex = index),
        ),
    );
  }

  Widget initBuildUi() {
    return <Widget>[
      ProductsScreen(),
      UnderDevelopmentScreen(),
      UnderDevelopmentScreen(),
      // UnderDevelopScreen(),
      ProfileScreen(),
    ][currentPageIndex];
  }

}
