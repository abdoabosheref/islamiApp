import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_styles.dart';

import '../../../utils/app_images.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotation = 0;
  List<String> azkarList = ['سبحان الله', 'الحمد لله', ' الله أكبر'];
  int index = 0 ;
  int azkarCounter = 0;



  @override
  Widget build(BuildContext context) {
    late String azarTextUpdate = azkarList[index];
    return Expanded(
      child: Column(
        mainAxisSize: .min,
        children: [
          Image.asset(AppImages.sebihaHead),
          Stack(
            alignment: .center,
            children: [
              Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    azarTextUpdate,
                    style: AppStyle.bold20white.copyWith(fontSize: 36),
                  ),
                  Text(
                    azkarCounter.toString(),
                    style: AppStyle.bold20white.copyWith(fontSize: 36),
                  ),
                ],
              ),
              InkWell(onTap: () => getRotationValue(),
                child: AnimatedRotation(
                  turns: rotation,
                  duration: Duration(milliseconds: 500),
                  child: Image.asset(AppImages.sebihaBody),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getRotationValue() {
    setState(() {

   if(azkarCounter < 33){
     azkarCounter++ ;
     rotation += 0.05 ;

   }else{
     azkarCounter = 0 ;
     index++;
   }
  if (index == azkarList.length  ){

     index = 0 ;
  }

    });
  }
}