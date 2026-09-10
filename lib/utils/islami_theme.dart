import 'package:flutter/material.dart';
import 'package:islami/utils/islami_colors.dart';
ThemeData darktheme=ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: IslamiColors.white,
        unselectedItemColor: IslamiColors.black_icon,
      ),
  appBarTheme: AppBarThemeData(
        backgroundColor: IslamiColors.darkBackgroundColor,
        iconTheme:IconThemeData(
          color: IslamiColors.goldColor,
        ) ,
    centerTitle: true
      )
);



