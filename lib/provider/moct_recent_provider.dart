import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/home/tabs/quran_tab/shared_pref_utiles.dart';

class MostRecentProvider extends ChangeNotifier{
  //todo: adding data that will change in more than one place
  // todo:& adding function that will change this data

  List<int> mostRecentList = [];

  //Todo : read data,get data => index

void getMostRecentList  () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Todo : get list data if empty return empty list
    List<String> mostRecentListAsString = prefs.getStringList(sharedPrefKeys.mostRecentKeys) ?? [];
//Todo : turn list data from type string to type integer using map method
  mostRecentList = mostRecentListAsString.map((listElement) => int.parse(listElement),).toList();

    // return mostRecentListAsInt ;
    // return mostRecentListAsInt.reversed.toList() ;
notifyListeners();
  }

}