import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/ui/utils/app_images.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_styles.dart';

class AzkarWidget extends StatefulWidget {
  const AzkarWidget({super.key});

  @override
  State<AzkarWidget> createState() => _AzkarWidgetState();
}

class _AzkarWidgetState extends State<AzkarWidget> {
  @override
  Widget build(BuildContext context) {
    var width = AppSize.width(context);
    var height = AppSize.height(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        builtAzkarButton(
          text:'Evening Azkar',
          imagePath: AppImages.eveAzkar,
          onPressed: () {},
        ),
        builtAzkarButton(
          text:'Morining Azkar',
          imagePath: AppImages.morAzkar,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget builtAzkarButton({
    required String text,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 170,
      height: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          backgroundColor: AppColor.black,
          elevation: 0,
          side: BorderSide(color: AppColor.gold, width:3),
        ),

        child: Padding(
          padding:  EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(imagePath),
              Text(text, style: AppStyle.bold20white),
            ],
          ),
        ),
      ),
    );
  }
}
