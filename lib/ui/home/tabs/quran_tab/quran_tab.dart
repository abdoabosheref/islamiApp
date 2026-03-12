import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/models/sura_list.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widget/most_recently.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widget/sura_item_widget.dart';
import 'package:islami_app/ui/utils/app_color.dart';
import 'package:islami_app/ui/utils/app_icons.dart';
import 'package:islami_app/ui/utils/app_images.dart';
import 'package:islami_app/ui/utils/app_styles.dart';
import 'package:islami_app/ui/utils/app_theme.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        spacing: height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (String text) {

              searchBySuraName(text);
            },
            cursorColor: AppColor.white,
            style: AppStyle.bold16white,
            decoration: InputDecoration(
              enabledBorder: buildDecorationBorder(),
              focusedBorder: buildDecorationBorder(),
              prefixIconConstraints: BoxConstraints(
                minWidth: width * 0.06,
                minHeight: height * 0.06,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: SvgPicture.asset(AppIcons.searchIcon),
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyle.bold16white,
            ),
          ),

          MostRecently(),

          Text('Sura List', style: AppStyle.bold16white),
          Expanded(
            child: filterList.isEmpty
                ? Center(
                    child: Text(
                      "No Data Found",
                      style: AppStyle.bold24gold.copyWith(fontSize: 40),
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return SuraItemWidget(index: filterList[index]);
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: AppColor.white,
                      thickness: 1,
                      endIndent: width * 0.06,
                      indent: width * 0.06,
                    ),
                    itemCount: filterList.length,
                  ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColor.gold, width: 2),
    );
  }

  void searchBySuraName(String text) {
    List<int> searchListResult = [];
    for (int i = 0; i < SuraList.arabicQuranList.length; i++) {
      if (SuraList.arabicQuranList[i].toLowerCase().contains(text.toLowerCase())) {
        searchListResult.add(i);
      }
      if (SuraList.englishQuranList[i].toLowerCase().contains(text.toLowerCase())) {
        searchListResult.add(i);
      }
    }
    filterList = searchListResult;
    setState(() {});
  }
}
