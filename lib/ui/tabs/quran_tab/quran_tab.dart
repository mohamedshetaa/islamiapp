import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/islami_rescources/resources.dart';
import 'package:islami/ui/tabs/quran_tab/most_recent_prefs.dart';
import 'package:islami/ui/widgets/most_recently.dart';
import 'package:islami/utils/islami_assets.dart';
import 'package:islami/utils/islami_colors.dart';

import '../../../utils/islami_styles.dart';
import '../../../utils/islami_size.dart';


class QuranScreen extends StatefulWidget {

   QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  int refreshKey=0;
List<int> filterList=List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineBorder(){
      return  OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: IslamiColors.goldColor,
            width: IslamiSize.width(context) * 0.004,
          )
      );
    }
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: IslamiSize.width(context)*0.04),
      child: Column(
        spacing: IslamiSize.height(context) * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (text){
              SearchBySuraName(text);
            },
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: IslamiStyles.bold16white,
              prefixIcon: Image.asset(IslamiAssets.text_icon),
              border: outlineBorder(),
              enabledBorder: outlineBorder(),
              focusedBorder: outlineBorder(),
            ),
            cursorColor: IslamiColors.goldColor,
            style: IslamiStyles.bold16white,
          ),
         MostRecently(key: ValueKey(refreshKey),),
          Text('Suras List',
          style: IslamiStyles.bold16white,),
         Expanded(child:filterList.isEmpty?Center(
           child: Text('No Sura Item Found ',
           style: IslamiStyles.bold20black.copyWith(color: IslamiColors.goldColor),),
         ): ListView.separated(
             itemBuilder:(context,index)=>
             ListTile(contentPadding: EdgeInsetsGeometry.all(0),
               onTap: ()async{
               saveSuraIndex(filterList[index]);
             await  Navigator.of(context).pushNamed('quran_details',
               arguments: filterList[index]);
             setState(() {
               refreshKey++;
             });
               },
               leading:
                   Stack(
                     alignment: Alignment.center,
                     children: [
                       Image.asset(IslamiAssets.vector),
                       Text('${filterList[index]+1}',
                       style: IslamiStyles.bold16white,)
                                    ],
                                  ),
               title: Align(alignment: Alignment.centerLeft,
                 child: Column(spacing: IslamiSize.height(context)*0.01,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(Resources.englishQuranSuras[filterList[index]],
                     style: IslamiStyles.bold20black.copyWith(
                       color: IslamiColors.white
                     ),),
                     Text('${Resources.AyaNumber[filterList[index]]} verses',
                     style: IslamiStyles.bold14black.copyWith(
                       color: IslamiColors.white
                     ),)
                   ],
                 ),
               ),
               trailing: Text(Resources.arabicQuranSuras[filterList[index]],
               style: IslamiStyles.bold20black.copyWith(
                 color: IslamiColors.white
               ),),

             ),
             separatorBuilder: (context,index)=>
             Divider(
               color: IslamiColors.white,
               thickness: IslamiSize.width(context)*0.004,
               endIndent:IslamiSize.width(context)*0.1 ,
               indent: IslamiSize.width(context)*0.1,
             ),
             itemCount: filterList.length))
        ],
      ),
    );
  }

  void SearchBySuraName(String text){
    List<int> searchList=[];
    for(int i=0;i<Resources.englishQuranSuras.length;i++)
      {
        if(Resources.englishQuranSuras[i].toLowerCase().contains(text.toLowerCase())||Resources.arabicQuranSuras[i].contains(text)){
          searchList.add(i);
        }
      }
    filterList=searchList;
    setState(() {

    });
  }
}



