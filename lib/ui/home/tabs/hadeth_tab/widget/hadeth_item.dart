import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadeth_model.dart';
import 'package:islami_app/ui/utils/app_color.dart';
import 'package:islami_app/ui/utils/app_icons.dart';
import 'package:islami_app/ui/utils/app_images.dart';

import '../../../../utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  HadethItem({super.key, required this.index});
  int index;

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadeth;

  // String hadethTitle  = '' ;

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints(minHeight: height * 0.60),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.012,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.gold,
      ),

      child: hadeth == null
          ? Center(child: CircularProgressIndicator(color: AppColor.gold))
          : SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/HadithCardBackGround 1.png',
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                constraints: BoxConstraints(minHeight: height * 0.66),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppImages.LeftCornerDec,
                          width: width * 0.21,
                          color: AppColor.black,
                        ),
                        Expanded(
                          child: Text(
                            hadeth?.title ?? '',
                            style: AppStyle.bold24black,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Image.asset(
                          AppImages.RightCornerDec,
                          width: width * 0.21,
                          color: AppColor.black,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Text(
                        hadeth?.content ?? '',
                        style: AppStyle.bold14black.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Image.asset(
                      AppImages.detailsBottomIcon,
                      width: double.infinity,
                      color: AppColor.black,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> loadHadethFile() async {
    String hadethContent = await rootBundle.loadString(
      'assets/files/hadeeth/h${widget.index}.txt',
    );
    List<String> hadethLines = hadethContent.split('\n');

    for (int i = 0; i < hadethLines.length; i++) {
      // String title = hadethLines[0];
      // hadethLines.removeAt(0);
      // hadethLines.join(' ');
      // print(title);
      int hadethFileContentIndex = hadethContent.indexOf('\n');
      String title = hadethContent.substring(0, hadethFileContentIndex);
      String content = hadethContent.substring(hadethFileContentIndex + 1);
      hadeth = HadethModel(title: title, content: content);
      // hadethTitle = title ;
      setState(() {});
    }
  }
}
