import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_devlivery/utils/colors.dart';
import 'package:food_devlivery/utils/dimensions.dart';
import 'package:food_devlivery/widget/big_text.dart';
import 'package:food_devlivery/widget/icon_text.dart';
import 'package:food_devlivery/widget/small_text.dart';

class FoodBdoyPage extends StatefulWidget {
  const FoodBdoyPage({Key? key}) : super(key: key);

  @override
  _FoodBdoyPageState createState() => _FoodBdoyPageState();
}

class _FoodBdoyPageState extends State<FoodBdoyPage> {
  PageController _pageController =
      PageController(viewportFraction: 0.85, initialPage: 0);

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Dimensions.pageView,
              child: PageView.builder(
                  itemCount: 5,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return _buildItemWidget(index);
                  }),
            ),
            new DotsIndicator(
              dotsCount: 5,
              position: _currentPageValue,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Row(
                children: [
                  SizedBox(width: Dimensions.heigh20),
                  BigText(text: "Popular"),
                  SizedBox(width: Dimensions.heigh10),
                  SmallText(text: 'Food'),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: Dimensions.heigh20),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 120,
                            margin: EdgeInsets.only(
                                left: Dimensions.heigh10,
                                right: Dimensions.heigh10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/image/food0.png"),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }

  // 构建滚动内容
  Widget _buildItemWidget(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - _scaleFactor) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.only(
                left: Dimensions.heigh10, right: Dimensions.heigh10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Colors.red : Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              padding: EdgeInsets.only(
                  left: Dimensions.heigh10,
                  right: Dimensions.heigh10,
                  top: Dimensions.heigh15),
              margin: EdgeInsets.only(
                  left: Dimensions.heigh20,
                  right: Dimensions.heigh20,
                  bottom: Dimensions.heigh20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "鸡腿套餐"),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: Dimensions.heigh15,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.heigh10),
                      SmallText(text: '4.5'),
                      SizedBox(width: Dimensions.heigh10),
                      SmallText(text: '1250'),
                      SizedBox(width: Dimensions.heigh10),
                      SmallText(text: 'comments'),
                    ],
                  ),
                  SizedBox(height: Dimensions.heigh10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconAndText(
                          text: "text",
                          icon: Icons.circle_sharp,
                          iconColor: AppColors.iconColor1),
                      IconAndText(
                          text: "定位",
                          icon: Icons.location_on,
                          iconColor: AppColors.iconColor2),
                      IconAndText(
                          text: "时间",
                          icon: Icons.timer,
                          iconColor: AppColors.mainColor),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
