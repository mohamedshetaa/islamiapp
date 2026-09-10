import 'package:flutter/material.dart';

import '../../../utils/islami_colors.dart';
import '../../../utils/islami_styles.dart';

class QuranShape2 extends StatelessWidget {
  final String content;
  const QuranShape2({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(content,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: IslamiStyles.bold20black.copyWith(
        color:  IslamiColors.goldColor,
      ),
    );
  }
}




