import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_list.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/shared_pref_utiles.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_theme.dart';

class MostRecently extends StatefulWidget {
  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  List<int> mostRecentList = [];
  @override
  void initState() {
    super.initState();
    readMostRecentList();
  }

  void readMostRecentList() async {
    mostRecentList = await getMostRecentList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Visibility(
      visible: mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.020,
        children: [
          Text(
            "Mosty Recently",
            style: AppTheme.darkTheme.textTheme.headlineSmall,
          ),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.QuranDetailsRouteName,
                    arguments: mostRecentList[index],
                  ),

                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.007,
                      horizontal: width * 0.039,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.gold,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Column(
                          spacing: height * 0.008,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              SuraList.englishQuranList[mostRecentList[index]],
                              style: buildText(fontSize: 24),
                            ),
                            Text(
                              SuraList.arabicQuranList[mostRecentList[index]],
                              style: buildText(fontSize: 24),
                            ),
                            Text(
                              "${SuraList.SuraVerse[mostRecentList[index]]} Verses",
                              style: AppTheme.darkTheme.textTheme.headlineSmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: AppColor.black,
                                  ),
                            ),
                          ],
                        ),
                        Row(children: [Image.asset(AppImages.mostRecentImage)]),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.02),
              itemCount: mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle buildText({required double fontSize}) {
    return TextStyle(
      color: AppColor.black,
      fontFamily: 'Janna LT Bold',
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }
}
