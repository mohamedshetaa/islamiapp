import 'package:flutter/material.dart';
import 'package:islami/utils/islami_styles.dart';

import '../../../utils/islami_colors.dart';
import '../../../utils/islami_size.dart';

class QuranShape1 extends StatefulWidget {
  final String content;
  final int index;
  const QuranShape1({super.key, required this.content, required this.index});

  @override
  State<QuranShape1> createState() => _QuranShape1State();
}

class _QuranShape1State extends State<QuranShape1> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: IslamiSize.height(context) * 0.005),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: IslamiSize.height(context) * 0.02,
            horizontal: IslamiSize.width(context) * 0.02,
          ),
          decoration: BoxDecoration(
            color: isClicked ? IslamiColors.goldColor : IslamiColors.darkBackgroundColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: IslamiColors.goldColor,
              width: IslamiSize.width(context) * 0.004,
            ),
          ),
          child: Text(
            '${widget.content} [${widget.index + 1}]',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: IslamiStyles.bold20black.copyWith(
              color: isClicked ? IslamiColors.darkBackgroundColor : IslamiColors.goldColor,
            ),
          ),
        ),
      ),
    );
  }
}




