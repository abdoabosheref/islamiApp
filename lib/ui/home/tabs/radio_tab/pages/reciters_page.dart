import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/ui/utils/app_color.dart';
import 'package:islami_app/ui/utils/app_icons.dart';
import 'package:islami_app/ui/utils/app_images.dart';
import 'package:islami_app/ui/utils/app_styles.dart';

import '../../../../utils/app_size.dart';

class RecitersPage extends StatelessWidget {
  RecitersPage({super.key});

  List<String> reciterList = [];


  @override
  Widget build(BuildContext context) {
    var width = AppSize.width(context);
    var height = AppSize.height(context);
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          width: width * 0.9,
          height: height * 0.17,
          decoration: BoxDecoration(
            color: AppColor.gold,
            borderRadius: BorderRadiusGeometry.circular(20),
            image: DecorationImage(image: AssetImage(AppImages.headerBG)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Ibrahim Al-Akdar', style: AppStyle.bold20black),
              Center(
                child: Row(
                  mainAxisSize: .min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.playButtonIcon),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.volumeOnIcon),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: 4,
      ),
    );
  }
}
