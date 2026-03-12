import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app/ui/home/tabs/statics_tab/statics_tab.dart';
import 'package:islami_app/ui/utils/app_color.dart';
import 'package:islami_app/ui/utils/app_icons.dart';
import 'package:islami_app/ui/utils/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  Map<int,String> imageList ={
    0 : AppImages.quranBG,
    1 : AppImages.hadethBG,
    2 : AppImages.sebihaBG,
    3 : AppImages.radioBG,
    4 : AppImages.staticsBG,
  };
  List<Widget> navBarTabs = [QuranTab(),HadethTab(),SebhaTab()
    ,RadioTab(),StaticsTab()];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
       Stack(
        children: [
          Image.asset(
            imageList[selectedIndex]!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
            body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Padding(
                padding:  EdgeInsets.only(top: 30),
                child: Image.asset(AppImages.headerBG),
              ),
                Expanded(child: navBarTabs[selectedIndex])

            ],),




            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },

              currentIndex: selectedIndex,
              items: [
                builtBottomNavigationBarItem(label:'Quran' ,iconName:AppIcons.quranIcon ,index:0 ),
                builtBottomNavigationBarItem(label:'Hadeth' ,iconName:AppIcons.hadethIcon ,index:1 ),
                builtBottomNavigationBarItem(label:'Sebiha' ,iconName:AppIcons.sebihaIcon ,index:2 ),
                builtBottomNavigationBarItem(label:'Radio' ,iconName:AppIcons.radioIcon ,index:3 ),
                builtBottomNavigationBarItem(label:'Statics' ,iconName:AppIcons.staticsIcon ,index:4 ),




              ],
            ),
          ),
        ],
      );


  }
  BottomNavigationBarItem builtBottomNavigationBarItem({required int index ,required String iconName,required String label}){
    return BottomNavigationBarItem(
        icon: bottomNavBarIcon(index: index,iconName: iconName),label: label

    );
  }
 Widget bottomNavBarIcon ({required int index,required String iconName}){

    return selectedIndex == index ?
      Container(
      width: 59,
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppColor.blackOp70,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),

      child: SvgPicture.asset(
        iconName,
        colorFilter: ColorFilter.mode(
          selectedIndex == index ? AppColor.white : AppColor.black,
          BlendMode.srcIn,
        ),
      ),
    )
    :
   SvgPicture.asset(
     iconName,
   colorFilter: ColorFilter.mode(
   selectedIndex == index ? AppColor.white : AppColor.black,
   BlendMode.srcIn,
   ),
   );
 }
}
