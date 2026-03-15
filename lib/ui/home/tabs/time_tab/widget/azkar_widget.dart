import 'package:flutter/material.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';

class AzkarWidget extends StatelessWidget {
  const AzkarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppSize.width(context);
    var height = AppSize.height(context);
    return Expanded(
      child: Container(
        height: height * 0.24,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(40),
          color: AppColor.gold,
        ),
      ),
    );
  }
}
