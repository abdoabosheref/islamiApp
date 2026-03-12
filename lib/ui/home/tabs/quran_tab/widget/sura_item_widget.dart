import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/shared_pref_utiles.dart';
import 'package:islami_app/ui/utils/app_icons.dart';
import 'package:islami_app/ui/utils/app_routes.dart';
import 'package:islami_app/ui/utils/app_styles.dart';
import 'package:islami_app/models/sura_list.dart';

import '../details/quran_details.dart';

class SuraItemWidget extends StatelessWidget {
  int index;

  SuraItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            leading: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AppIcons.suraFrameIcon),
                Text('${index + 1}', style: AppStyle.bold14white),
              ],
            ),
            title: Text(
              SuraList.englishQuranList[index],
              style: AppStyle.bold20white,
            ),
            subtitle: Text(
              '${SuraList.SuraVerse[index]}Verses',
              style: AppStyle.bold14white,
            ),
            trailing: Text(
              SuraList.arabicQuranList[index],
              style: AppStyle.bold20white,
            ),
            onTap: () {
              saveSuraIndex(index);

              Navigator.of(
                context,
              ).pushNamed(AppRoutes.QuranDetailsRouteName, arguments: index);
            },
          ),
        ),
      ],
    );
  }
}
