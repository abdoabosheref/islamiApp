import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/ui/utils/app_color.dart';
import 'package:islami_app/ui/utils/app_icons.dart';
import 'package:islami_app/ui/utils/app_images.dart';
import 'package:islami_app/ui/utils/app_routes.dart';
import 'package:islami_app/ui/utils/app_styles.dart';
import 'package:islami_app/models/sura_list.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/moct_recent_provider.dart';
import '../widget/quran_content.dart';

class QuranDetails extends StatefulWidget {
  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsLineState();
}

class _QuranDetailsLineState extends State<QuranDetails> {
  String verses = '';
  late MostRecentProvider mostRecentProvider ;
  // int pageIndex = 0 ; INDEXED STACK VARIABLE
  List<String> versesContainer = [];
  PageController pageControl = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var index = ModalRoute.of(context)?.settings.arguments as int;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    if (verses.isEmpty) {
      loadQuranFileLines(index);
    }
    if (versesContainer.isEmpty) {
      loadQuranFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          // UN COMMENT TO USE INDEXED STACK BUTTONS
          // IconButton(onPressed: (){
          //   setState(() {
          //     pageIndex = 0 ;
          //   });
          // }, icon: Icon(Icons.square ,color: AppColor.gold,)),
          // IconButton(onPressed: (){
          //   setState(() {
          //     pageIndex = 1 ;
          //   });
          // }, icon: Icon(Icons.line_weight ,color: AppColor.gold,)), in  to
          IconButton(
            onPressed: () {
              pageControl.animateToPage(
                0,
                duration: Duration(microseconds: 300),
                curve: Curves.linear,
              );
            },
            icon: Icon(Icons.square, color: AppColor.gold),
          ),
          IconButton(
            onPressed: () {
              pageControl.animateToPage(
                1,
                duration: Duration(microseconds: 300),
                curve: Curves.linear,
              );
            },
            icon: Icon(Icons.line_weight, color: AppColor.gold),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
          },
          icon: Icon(Icons.arrow_back),
        ),

        title: Text(
          SuraList.englishQuranList[index],
          style: AppStyle.bold20gold,
        ),
      ),
      body: Column(
        mainAxisAlignment: .spaceBetween,
        spacing: height * 0.01,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.LeftCornerDec),
                Text(
                  SuraList.arabicQuranList[index],
                  style: AppStyle.bold24gold,
                ),
                Image.asset(AppImages.RightCornerDec),
              ],
            ),
          ),
          // UN COMMENT TO USE INDEXED STACK
          // Expanded(
          //   child: IndexedStack(index: pageIndex ,children: [
          //     verses.isEmpty?
          //     Center(child: CircularProgressIndicator(color: AppColor.gold,))
          //         :
          //     SingleChildScrollView(padding:EdgeInsets.symmetric(horizontal:width*0.06)
          //         ,child:
          //         Text(verses ,style: AppStyle.bold20gold,
          //           textAlign: TextAlign.center,
          //         )),
          //     versesContainer.isEmpty?
          //     Center(child: CircularProgressIndicator(color: AppColor.gold,))
          //         :
          //     ListView.separated(
          //         itemBuilder: (context, index) {
          //           return QuranContent(content: '${versesContainer[index]},[${index+1}]',);
          //         },
          //         separatorBuilder: (context, index) => SizedBox(height: height*0.02,),
          //         itemCount: versesContainer.length),
          //
          //   ],),
          // ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageControl,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              children: [
                verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(color: AppColor.gold),
                      )
                    : SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: Text(
                          verses,
                          style: AppStyle.bold20gold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                versesContainer.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(color: AppColor.gold),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return QuranContent(
                            content: '${versesContainer[index]},[${index + 1}]',
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: height * 0.02),
                        itemCount: versesContainer.length,
                      ),
              ],
            ),
          ),

          Image.asset(AppImages.detailsBottomIcon),
        ],
      ),
    );
  }

  void loadQuranFileLines(int index) async {
    String content = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = content.split(RegExp(r'\r?\n'));
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }
    verses = lines.join(' ');

    setState(() {});
  }

  void loadQuranFile(int index) async {
    String content = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = content.split(RegExp(r'\r?\n'));

    setState(() {
      versesContainer = lines;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getMostRecentList();
  }
}
