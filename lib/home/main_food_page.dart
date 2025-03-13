import 'package:flutter/material.dart';
import 'package:food_devlivery/home/food_bdoy_page.dart';
import 'package:food_devlivery/utils/colors.dart';
import 'package:food_devlivery/widget/big_text.dart';
import 'package:food_devlivery/widget/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: '上海',
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(text: '定位'),
                        Icon(
                          Icons.keyboard_arrow_down,
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainColor,
                  ),
                )
              ],
            ),
          ),
          FoodBdoyPage(),
        ],
      ),
    );
  }
}
