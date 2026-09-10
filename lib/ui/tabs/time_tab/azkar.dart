import 'package:flutter/material.dart';
import '../../../utils/islami_colors.dart';
import '../../../utils/islami_size.dart';
import '../../../utils/islami_styles.dart';

class Azkar extends StatelessWidget {
  String azkar_name;
  String pic;
   Azkar({super.key,required this.azkar_name,required this.pic});

  @override
  Widget build(BuildContext context) {
    return    Expanded(child: Container(
      padding: EdgeInsets.symmetric(
        vertical: IslamiSize.height(context)*0.02
      ),
      decoration: BoxDecoration(
          color: IslamiColors.darkBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: IslamiColors.goldColor,
              width: IslamiSize.width(context)*0.004
          )
      ),
      child: Column(
        children: [
          Image.asset(pic),
          Text(azkar_name,
            style: IslamiStyles.bold20black.copyWith(color: IslamiColors.white),)
        ],
      ),
    ));}
}




