import 'package:flutter/material.dart';

import '../../../utils/islami_colors.dart';
import '../../../utils/islami_styles.dart';

class CursolContainer extends StatelessWidget {
  int index;
  List<Map<String,String>> prayerTimes;
  List<String> timeParts;
   CursolContainer({super.key,required this.index,required this.prayerTimes,required this.timeParts});

  @override
  Widget build(BuildContext context) {
    return  Container(
     clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            IslamiColors.darkBackgroundColor,
            IslamiColors.goldColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1,0.9]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            prayerTimes[index]['name']!,
            style: IslamiStyles.bold16white,
            textAlign: TextAlign.center,
          ),
          Text(
            timeParts[0],
            style: IslamiStyles.bold20black.copyWith(
                color: Colors.white, fontSize: 32, height: 1.1),
            textAlign: TextAlign.center,
          ),
          Text(
            timeParts[1],
            style: IslamiStyles.bold16white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}




