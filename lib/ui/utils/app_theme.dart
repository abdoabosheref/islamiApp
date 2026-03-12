import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_color.dart';

abstract class AppTheme {

  static final ThemeData  darkTheme =ThemeData(
      scaffoldBackgroundColor: AppColor.blackOp70,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:AppColor.gold,
      selectedItemColor:  AppColor.white,
      unselectedItemColor: AppColor.black,
      showSelectedLabels: true,
    ),

      textTheme:TextTheme(
        headlineSmall:
      TextStyle(color:AppColor.white,
          fontFamily:'Janna LT Bold',
          fontWeight:FontWeight.bold,),),


    appBarTheme: AppBarTheme(centerTitle: true,
    backgroundColor: AppColor.trans,
    iconTheme: IconThemeData(color: AppColor.gold,size: 18),
    )

  );

}