import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initstate() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
        print("Current value is" + _currPageValue.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
          itemBuilder: (context,position){
        return _buildPageItem(position);
      }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
      Container(
      height: 220,
      margin: EdgeInsets.only(left: 10, right:10,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                "assets/image/food0.png"
            )
        ),
      ),
    ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom:30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:Colors.white,

            ),
            child: Container(
              padding: EdgeInsets.only(top:10, left:15,right:15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text:"Chinese Side"),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Wrap(
                        children:
                          List.generate(5, (index) => Icon(Icons.star, color:AppColors.mainColor, size:15) ),

                      ),
                      SizedBox(width:10),
                      SmallText(text:"4.5"),
                      SizedBox(width:10),
                      SmallText(text:"1287"),

                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on,
                        text: "1.7km",
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: "32min",
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }
}
