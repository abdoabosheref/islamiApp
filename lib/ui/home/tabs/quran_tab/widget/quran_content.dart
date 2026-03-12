import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/ui/utils/app_color.dart';
import 'package:islami_app/models/sura_list.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_styles.dart';

class QuranContent extends StatelessWidget{
  String content ;




  QuranContent({ required this.content,});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


   return Padding(
     padding:  EdgeInsets.symmetric(horizontal: width * 0.04),
     child: InkWell(
         onTap: () {

         },
       child: Container(width:width*0.9,
         constraints: BoxConstraints(minHeight: height*0.10,),
         decoration: BoxDecoration(color: AppColor.trans  ,
             borderRadius: BorderRadius.circular(15 ),
             border:BoxBorder.all( color: AppColor.gold),  ),

         child: Padding(
           padding: const EdgeInsets.all(10),
           child: Center(
             child: Text(content,textDirection: TextDirection.ltr,
               style: AppStyle.bold20gold ,
               textAlign: TextAlign.center,),
           ),
         ),
       ),
     )


    );
  }
}