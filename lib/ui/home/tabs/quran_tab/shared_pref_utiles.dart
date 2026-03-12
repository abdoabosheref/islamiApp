import 'package:shared_preferences/shared_preferences.dart';

//Todo : write data,save data => index

class sharedPrefKeys {
  static String mostRecentKeys = 'most_recent';
}



Future<void> saveSuraIndex (int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo: get list of shard prefs if empty return empty list
  List<String> mostRecentList = prefs.getStringList(sharedPrefKeys.mostRecentKeys) ?? [];
  //todo : save index im mostRecentList
  //todo : avoid duplicated index
  if(mostRecentList.contains('$newSuraIndex')){
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  }else{
    mostRecentList.insert(0,'$newSuraIndex');
  }
  //Todo : list limit range
  if(mostRecentList.length > 3){
  mostRecentList.removeLast();
  }

  //todo: save list in shared pref
  await prefs.setStringList(sharedPrefKeys.mostRecentKeys, mostRecentList);

}

//Todo : read data,get data => index

Future<List<int>> getMostRecentList  () async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //Todo : get list data if empty return empty list
  List<String> mostRecentListAsString = prefs.getStringList(sharedPrefKeys.mostRecentKeys) ?? [];
//Todo : turn list data from type string to type integer using map method
  List<int> mostRecentListAsInt = mostRecentListAsString.map((listElement) => int.parse(listElement),).toList();

  return mostRecentListAsInt ;
  // return mostRecentListAsInt.reversed.toList() ;

}