import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/pages/radio_page.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/pages/reciters_page.dart';
import 'package:islami_app/ui/utils/app_color.dart';
import 'package:islami_app/ui/utils/app_size.dart';
import 'package:islami_app/ui/utils/app_styles.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  PageController control = PageController();
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    var width = AppSize.width(context);
    var height = AppSize.height(context);

    return Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                builtElevateButton(index: 0, buttname: 'Radio'),
                builtElevateButton(index: 1, buttname: 'Reciters'),
              ],
            ),
            Expanded(
              child: PageView(
                controller: control,
                children: [RadioPage(), RecitersPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle builtElevatedButtonStyle({required index}) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      backgroundColor: selectedIndex == index ? AppColor.gold : AppColor.trans,
    );
  }

  Widget builtElevateButton({required index, required buttname}) {
    return Expanded(
      child: ElevatedButton(
        style: builtElevatedButtonStyle(index: index),
        onPressed: () {
          setState(() {
            selectedIndex = index;
            control.jumpToPage(index);
          });
        },
        child: Text(buttname),
      ),
    );
  }
}
