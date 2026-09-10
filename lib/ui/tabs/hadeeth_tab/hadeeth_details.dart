import 'package:flutter/material.dart';
import 'package:islami/ui/tabs/hadeeth_tab/hadeeth_args.dart';
import 'package:islami/ui/tabs/hadeeth_tab/hadeeth_item.dart';
import 'package:islami/ui/tabs/quran_tab/quran_shape_2.dart';
import 'package:islami/utils/islami_styles.dart';
import 'package:islami/utils/islami_assets.dart';
import 'package:islami/utils/islami_colors.dart';
import 'package:islami/utils/islami_size.dart';

class HadeethDetails extends StatelessWidget {

  HadeethDetails({super.key});

  @override
  Widget build(BuildContext context) {

    HadeethArgs args = ModalRoute
        .of(context)
        ?.settings
        .arguments as HadeethArgs;
    return Scaffold(
        backgroundColor: IslamiColors.darkBackgroundColor,
        appBar: AppBar(
          title: Text('Hadith ${args.index}',
            style: IslamiStyles.bold20black.copyWith(
                color: IslamiColors.goldColor
            ),),

        ),
        body: Column(
          spacing: IslamiSize.height(context) * 0.01,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:
              IslamiSize.width(context) * 0.02),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(IslamiAssets.left_corner),
                  Text(args.hadeethItem!.title, style:
                  IslamiStyles.bold20black.copyWith(
                      color: IslamiColors.goldColor,
                      fontSize: 24
                  ),),
                  Image.asset(IslamiAssets.right_corner)
                ],
              ),
            ),
            Expanded(child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: IslamiSize.width(context) * 0.04),
                child:
                SingleChildScrollView(
                  child: QuranShape2(content: args.hadeethItem!.hadeeth_content),
                )
            )),

            Image.asset(IslamiAssets.mosque)
          ],
        )
    );
  }
}



