import 'package:flutter/material.dart';
import 'package:islami/islami_rescources/resources.dart';
import 'package:islami/ui/tabs/quran_tab/most_recent_prefs.dart';

import '../../utils/islami_styles.dart';
import '../../utils/islami_assets.dart';
import '../../utils/islami_colors.dart';
import '../../utils/islami_size.dart';

class MostRecently extends StatefulWidget {

   MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
List<int> mostRecentList=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSuraIndex();
  }
  getSuraIndex()
  async {
    mostRecentList= await getMostRecentList();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentList.isNotEmpty,
      child: Column(
        spacing:  IslamiSize.height(context)*0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently ',
            style: IslamiStyles.bold16white,
          ),
          SizedBox(height: IslamiSize.height(context)*0.15,
            child: ListView.separated(scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>
                    Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: IslamiColors.goldColor
                      ),
                      child:Row(
                        spacing: IslamiSize.width(context)*0.02,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: IslamiSize.width(context)*0.02,
                                vertical: IslamiSize.height(context)*0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Resources.englishQuranSuras[mostRecentList[index]],
                                  style: IslamiStyles.bold20black,),
                                Text(Resources.arabicQuranSuras[mostRecentList[index]],
                                  style: IslamiStyles.bold20black,),
                                Text('${Resources.AyaNumber[mostRecentList[index]]} Verses  ',
                                  style: IslamiStyles.bold14black,)
                              ],
                            ),
                          ),
                          Image.asset(IslamiAssets.most_recent)
                        ],
                      ) ,
                    ),
                separatorBuilder: (context,index)=>SizedBox(width:  IslamiSize.width(context)*0.02),
                itemCount: mostRecentList.length),
          )
        ],
      ),
    );
  }
}



