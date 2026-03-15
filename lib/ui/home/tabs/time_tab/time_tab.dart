import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/time_tab/widget/azkar_widget.dart';
import 'package:islami_app/ui/home/tabs/time_tab/widget/time_widget.dart';
import 'package:islami_app/ui/utils/app_color.dart';
import 'package:islami_app/ui/utils/app_size.dart';
import 'package:islami_app/ui/utils/app_styles.dart';

class TimeTab extends StatelessWidget {
  TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppSize.width(context);
    var height = AppSize.height(context);
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: height * 0.01,horizontal: width*0.04),
      child: Column(
        spacing: height *0.010,
        children: [
          TimeWidget(),
          Row(children: [Text('Azkar', style: AppStyle.bold16white)]),
          AzkarWidget(),
        ],
      ),
    );
  }
}
