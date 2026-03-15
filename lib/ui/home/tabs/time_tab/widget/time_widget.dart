import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/ui/utils/app_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_styles.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppSize.width(context);
    var height = AppSize.height(context);
    return Container(
      height: height * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(40),
        color: AppColor.lightBrown,
      ),
      child: Stack(
        children: [
          SvgPicture.asset(AppIcons.timeBackGround, fit: BoxFit.fill),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('16Jul,', style: AppStyle.bold16white),
                        Text('2024', style: AppStyle.bold16white),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Pray Time',
                          style: AppStyle.bold20black.copyWith(
                            color: AppColor.blackOp70,
                          ),
                        ),
                        Text('Tuesday', style: AppStyle.bold20black),
                      ],
                    ),
                    Column(
                      children: [
                        Text('09 Muh,', style: AppStyle.bold16white),
                        Text('1446', style: AppStyle.bold16white),
                      ],
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(viewportFraction:0.3 ,
                  enlargeCenterPage: true ,height: height*0.15),
                items: [1,2,3,4,5,6].map((index) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: width * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Color(0xFF202020),
                                Color(0xFFB19768),
                              ],
                                begin:Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                          ),
                          child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('ASR', style: AppStyle.bold14white,),
                              Text('04:38', style: AppStyle.bold16white.copyWith(fontSize: 24),),
                              Text('PM', style: AppStyle.bold14white,),

                            ],

                          )
                      );
                    },
                  );
                }).toList(),
              ),





              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text.rich(
                        TextSpan(
                          text: 'Next Pray - ',
                          style: AppStyle.bold16white.copyWith(
                            fontWeight: FontWeight.normal,
                            color: AppColor.blackOp70,
                          ),
                          children: [
                            TextSpan(
                              text: '2:32',
                              style: AppStyle.bold16white.copyWith(
                                color: AppColor.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppIcons.volumeOffIcon,
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
