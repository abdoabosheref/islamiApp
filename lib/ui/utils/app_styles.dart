import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppStyle extends StatelessWidget{
  static const TextStyle bold16white = TextStyle(fontSize:16,fontWeight: FontWeight.bold,
  fontFamily: 'Janna LT Bold',color: AppColor.white);
  static const TextStyle bold14white = TextStyle(fontSize:14,fontWeight: FontWeight.bold,
      fontFamily: 'Janna LT Bold',color: AppColor.white);
  static const TextStyle bold20white = TextStyle(fontSize:20,fontWeight: FontWeight.bold,
      fontFamily: 'Janna LT Bold',color: AppColor.white);
  static const TextStyle bold24black = TextStyle(fontSize:24,fontWeight: FontWeight.bold,
      fontFamily: 'Janna LT Bold',color: AppColor.black);
  static const TextStyle bold14black = TextStyle(fontSize:14,fontWeight: FontWeight.bold,
      fontFamily: 'Janna LT Bold',color: AppColor.black);
  static const TextStyle bold20gold = TextStyle(fontSize:20,fontWeight: FontWeight.bold,
      fontFamily: 'Janna LT Bold',color: AppColor.gold);
  static const TextStyle bold24gold = TextStyle(fontSize:24,fontWeight: FontWeight.bold,
      fontFamily: 'Janna LT Bold',color: AppColor.gold);
  static const TextStyle bold16gold = TextStyle(fontSize:16,fontWeight: FontWeight.bold,
      fontFamily: 'Janna LT Bold',color: AppColor.gold);

  static const TextStyle bold20black = TextStyle(fontSize:20,fontWeight: FontWeight.bold,
      fontFamily: 'Janna LT Bold',color: AppColor.black);
}