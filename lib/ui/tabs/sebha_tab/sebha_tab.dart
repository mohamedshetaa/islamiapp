import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/islami_rescources/resources.dart';
import 'package:islami/utils/islami_assets.dart';
import 'package:islami/utils/islami_size.dart';
import 'package:islami/utils/islami_styles.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter=0;
  bool changed=false;
  double angle = 0;
  int beads = 30;
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: IslamiSize.height(context)*0.001,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(Resources.sebhaList1[index],
        style: IslamiStyles.bold16white.copyWith(
          fontSize: 36,
        ),
        textAlign: TextAlign.center,),
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Image.asset(IslamiAssets.sebha2),
                GestureDetector(
                  onTap: onSebhaTap,
                  child: AnimatedRotation(
                    turns: angle / (2 * pi),
                    duration: const Duration(milliseconds: 300),
                    child: Image.asset(IslamiAssets.sebha),
                  ),
                ),
              ],
            ),
            Column(
              spacing: IslamiSize.height(context)*0.005
              ,children: [
                SizedBox(height: IslamiSize.height(context)*0.09),
                Text(Resources.sebhaList2[index],
                 style: IslamiStyles.bold16white.copyWith(
                   fontSize: 36
                 ),),
                Text(counter.toString(),
                style: IslamiStyles.bold16white.copyWith(
                      fontSize: 36,))
              ],
            )
          ],
        )
      ],
    );
  }

  void onSebhaTap() {
    setState(() {
      angle += (2 * pi) / beads;
      counter++;
      if(counter==33)
        {
          counter=0;
          index++;
          if(index==3)
            {
              index=0;
            }

        }
    });
  }
}




