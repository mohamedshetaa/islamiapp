import 'package:shared_preferences/shared_preferences.dart';
class MostRecentPrefsKey {
  static String mostRecentKey='most_recent';
}
void saveSuraIndex(int suraIndex)async
{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String> mostRecentList = prefs.getStringList(MostRecentPrefsKey.mostRecentKey)??[];
  if(mostRecentList.contains('$suraIndex')){
    mostRecentList.remove('$suraIndex');
    mostRecentList.insert(0, '$suraIndex');
  }else{
  mostRecentList.insert(0, '$suraIndex');}
  if(mostRecentList.length>3)
    {
      mostRecentList.removeLast();
    }
  await prefs.setStringList(MostRecentPrefsKey.mostRecentKey,mostRecentList);
}
 Future< List<int>> getMostRecentList()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String> mostRecentListAsString = prefs.getStringList(MostRecentPrefsKey.mostRecentKey)??[];
 List<int> mostRecentListAsInt= mostRecentListAsString.map((element)=>int.parse(element)).toList();
 return mostRecentListAsInt;
}



