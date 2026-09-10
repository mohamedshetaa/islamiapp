import 'package:flutter/material.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/welcome_screen.dart';
import 'package:islami/ui/tabs/hadeeth_tab/hadeeth_details.dart';
import 'package:islami/ui/tabs/quran_tab/quran_details.dart';
import 'package:islami/utils/islami_theme.dart' as Islami_theme;

void main()
{
  runApp(Islami());
}
class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'welcome_screen' ,
      routes:{
        'welcome_screen':(context)=>WelcomeScreen(),
        'home_screen':(context)=>HomeScreen(),
        'quran_details':(context)=>QuranDetails(),
        'hadeeth_details':(context)=>HadeethDetails(),
      } ,
      darkTheme: Islami_theme.darktheme,
      themeMode:ThemeMode.dark ,
    );
  }
}




