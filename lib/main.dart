
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/details/quran_details.dart';
import 'package:islami_app/ui/intro/intro_screen.dart';
import 'package:islami_app/ui/utils/app_routes.dart';
import 'package:islami_app/ui/utils/app_theme.dart';
import 'ui/home/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,

initialRoute: AppRoutes.introRouteName,
      routes: {
      AppRoutes.homeRouteName :  (context)=>HomeScreen(),
        AppRoutes.introRouteName:(context)=>OnBoardingPage(),
        AppRoutes.QuranDetailsRouteName:(context)=>QuranDetails()


      },
      theme:AppTheme.darkTheme,
      themeMode:ThemeMode.dark ,

    );
  }
  // OnBoardingPage()
}