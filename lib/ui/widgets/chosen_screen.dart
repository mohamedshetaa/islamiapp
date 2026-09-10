import 'package:flutter/material.dart';

import '../tabs/hadeeth_tab/hadeeth_tab.dart';
import '../tabs/quran_tab/quran_tab.dart';
import '../tabs/radio_tab/radio_tab.dart';
import '../tabs/sebha_tab/sebha_tab.dart';
import '../tabs/time_tab/time_tab.dart';

Widget chosenScreen(int index)
{
  switch(index)
  {
    case 0:
      return QuranScreen();
    case 1:
      return HadeethScreen();
    case 2:
      return SebhaScreen();
    case 3:
      return RadioScreen();
    case 4:
      return TimeScreen();
    default:
      return QuranScreen();
  }
}



