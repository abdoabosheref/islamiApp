import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/widget/hadeth_item.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});


  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  CarouselSlider(
      options: CarouselOptions(height: height*0.66 ,enlargeCenterPage: true),
      items: List.generate( 50, (index) => index+1,).map((index) {
        return HadethItem(index: index);
      }).toList(),
    );
  }
}
