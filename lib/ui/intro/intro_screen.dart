import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import '../utils/app_styles.dart';
import '../utils/app_color.dart';

void main() => runApp(const App());



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,

      home:  OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    var width = MediaQuery.of(context).size.width ;
    var height = MediaQuery.of(context).size.height ;

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: AppColor.black,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(backgroundColor: AppColor.trans,

      body: IntroductionScreen(
        key: introKey,
        allowImplicitScrolling: false,
        autoScrollDuration: null,
        infiniteAutoScroll: false,



        pages: [

          PageViewModel(
            titleWidget:Image.asset('assets/images/top_decration.png'
                ,width:width*0.62 ,height:height*0.18 ),
            bodyWidget: Column(spacing: height*0.08
              ,
              children:  [
                Image.asset('assets/images/intro1.png',width:width*0.93 ,height:height*0.38),
                Text('Welcome To Islami App',style: AppStyle.bold24gold)
              ],
            ),


          ),
          PageViewModel(
            titleWidget:Image.asset('assets/images/top_decration.png'
                ,width:width*0.63 ,height:height*0.18 ),
            bodyWidget: Column(spacing: height*0.04
              ,
              children:  [
                Image.asset('assets/images/intro2.png'
                    ,width:width*0.93 ,height:height*0.40),
                Text('Welcome To Islami App',style: AppStyle.bold24gold),
                Text('We Are Very Excited To Have You In \nOur Community',
                    style: AppStyle.bold20gold,textAlign: TextAlign.center,)
              ],
            ),


          ),
          PageViewModel(
            titleWidget:Image.asset('assets/images/top_decration.png'
                ,width:width*0.63 ,height:height*0.18 ),
            bodyWidget: Column(spacing: height*0.04
              ,
              children:  [
                Image.asset('assets/images/intro3.png',width:width*0.93 ,height:height*0.38),
                Text('Reading the Quran',style: AppStyle.bold24gold),
                Text('Read, and your Lord is the Most Generous',
                  style: AppStyle.bold20gold,textAlign: TextAlign.center,)
              ],
            ),


          ),
          PageViewModel(
            titleWidget:Image.asset('assets/images/top_decration.png'
                ,width:width*0.63 ,height:height*0.18 ),
            bodyWidget: Column(spacing: height*0.04
              ,
              children:  [
                Image.asset('assets/images/intro4.png',width:width*0.93 ,height:height*0.38),
                Text('Bearish',style: AppStyle.bold24gold),
                Text('Praise the name of your Lord, the Most High',
                  style: AppStyle.bold20gold,textAlign: TextAlign.center,)
              ],
            ),


          ),
          PageViewModel(
            titleWidget:Image.asset('assets/images/top_decration.png'
                ,width:width*0.63 ,height:height*0.18 ),
            bodyWidget: Column(spacing: height*0.04
              ,
              children:  [
                Image.asset('assets/images/intro5.png',width:width*0.93 ,height:height*0.38),
                Text('Holy Quran Radio',style: AppStyle.bold24gold),
                Text('You can listen to the Holy Quran\n Radio through the application for free and easily',
                  style: AppStyle.bold20gold,textAlign: TextAlign.center,)
              ],
            ),


          ),








        ],

        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        //rtl: true, // Display as right-to-left
        back: const Text("Back",style: AppStyle.bold16gold,),
        skip: const Text("Skip",style: AppStyle.bold16gold,),
        next: const Text("Next",style: AppStyle.bold16gold,),
        done: const Text("Finish",style: AppStyle.bold16gold,),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.grey,
          activeSize: Size(22.0, 10.0),
          activeColor: AppColor.gold,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: AppColor.trans,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}

