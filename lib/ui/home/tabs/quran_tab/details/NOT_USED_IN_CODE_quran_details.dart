// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:islami_app/ui/utils/app_color.dart';
// import 'package:islami_app/ui/utils/app_icons.dart';
// import 'package:islami_app/ui/utils/app_images.dart';
// import 'package:islami_app/ui/utils/app_routes.dart';
// import 'package:islami_app/ui/utils/app_styles.dart';
// import 'package:islami_app/models/sura_list.dart';
//
// import '../widget/quran_content.dart';
//
// class QuranDetails extends StatefulWidget {
//    QuranDetails({super.key});
//
//   @override
//   State<QuranDetails> createState() => _QuranDetailsState();
// }
//
// class _QuranDetailsState extends State<QuranDetails> {
//    List<String> verses =[];
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     var index = ModalRoute.of(context)?.settings.arguments as int;
//
//
// if (verses.isEmpty){
//   loadQuranFile(index);
// }
//
//
//     return Scaffold(
//       appBar: AppBar(
//         leading:IconButton(onPressed: (){
//         Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
//       }, icon: Icon(Icons.arrow_back)) ,
//
//         title: Text(SuraList.englishQuranList[index],style: AppStyle.bold20gold,),),
//       body: Column(mainAxisAlignment: .spaceBetween,spacing: height * 0.01,
//         children: [
//           Padding(
//             padding:  EdgeInsets.symmetric(horizontal: width * 0.03),
//             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(AppImages.LeftCornerDec),
//                 Text(SuraList.arabicQuranList[index],style: AppStyle.bold24gold,),
//                 Image.asset(AppImages.RightCornerDec),
//
//               ],
//             ),
//           ),
//           Expanded(child: verses.isEmpty?
//               Center(child: CircularProgressIndicator(color: AppColor.gold,))
//               :
//           ListView.separated(
//               itemBuilder: (context, index) {
//                 return QuranContent(content: '[${index+1}],${verses[index]}',);
//               },
//               separatorBuilder: (context, index) => SizedBox(height: height*0.02,),
//               itemCount: verses.length)),
//
//           Image.asset(AppImages.detailsBottomIcon),
//         ],
//       ),
//
//     );
//   }
//
// void loadQuranFile (int index) async{
//     String content =await rootBundle.loadString('assets/files/quran/${index+1}.txt');
//     List <String> lines =content.split('\n');
//
//
//     setState(() {
//       verses=lines ;
//     });
//
// }
//
//
// }
