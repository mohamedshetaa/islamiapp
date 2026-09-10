import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/islami_rescources/resources.dart';
import 'package:islami/ui/tabs/quran_tab/quran_shape_1.dart';
import 'package:islami/ui/tabs/quran_tab/quran_shape_2.dart';
import 'package:islami/utils/islami_styles.dart';
import 'package:islami/utils/islami_assets.dart';
import 'package:islami/utils/islami_colors.dart';
import 'package:islami/utils/islami_size.dart';

class QuranDetails extends StatefulWidget {

   QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  String quran_content='';
  bool second_shape=true;
  List<String> verses=[];
  @override
  Widget build(BuildContext context) {
    int index=ModalRoute.of(context)?.settings.arguments as int;
    if(quran_content.isEmpty){
      loadSuraFile2(index);}
    if(verses.isEmpty){
      loadSuraFile1(index);
    }
    return Scaffold(
      backgroundColor: IslamiColors.darkBackgroundColor,
      appBar: AppBar(
        title: Text(Resources.englishQuranSuras[index],
        style: IslamiStyles.bold20black.copyWith(
          color: IslamiColors.goldColor
        ),),
        actions: [
          IconButton(onPressed: (){
            second_shape==true?second_shape=false:second_shape=true;
            setState(() {

            });
          }, icon: Icon(Icons.change_circle))
        ],
      ),
      body:second_shape==true? Column(
        spacing: IslamiSize.height(context)*0.01,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:
            IslamiSize.width(context)*0.02),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(IslamiAssets.left_corner),
                Text(Resources.arabicQuranSuras[index],style:
                  IslamiStyles.bold20black.copyWith(
                    color: IslamiColors.goldColor,
                    fontSize: 24
                  ),),
                Image.asset(IslamiAssets.right_corner)
              ],
            ),
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: IslamiSize.width(context)*0.04),
            child:quran_content.isEmpty?Center(child: CircularProgressIndicator(color: IslamiColors.goldColor,)):
            SingleChildScrollView(
              child: QuranShape2(content: quran_content),
            )
          )),

          Image.asset(IslamiAssets.mosque)
        ],
      ):Column(
        spacing: IslamiSize.height(context)*0.01,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:
            IslamiSize.width(context)*0.02),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(IslamiAssets.left_corner),
                Text(Resources.arabicQuranSuras[index],style:
                IslamiStyles.bold20black.copyWith(
                    color: IslamiColors.goldColor,
                    fontSize: 24
                ),),
                Image.asset(IslamiAssets.right_corner)
              ],
            ),
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: IslamiSize.width(context)*0.04),
            child:verses.isEmpty?Center(child: CircularProgressIndicator(color: IslamiColors.goldColor,)):
            ListView.separated(
                itemBuilder:(context,index)=> QuranShape1(content: verses[index], index: index,), separatorBuilder: (context,index)=>
                SizedBox(height: IslamiSize.height(context)*0.01,), itemCount: verses.length),
          )),

          Image.asset(IslamiAssets.mosque)
        ],
      ),
    );
  }

  void loadSuraFile2(int index) async{
    String content=await rootBundle.loadString('assets/files/Suras/${index+1}.txt');
    List<String> lines=content.split('\n');
    for(int i=0;i<lines.length;i++)
      {
        lines[i]+='[${i+1}]';
      }
   content= lines.join(' ');
    quran_content=content;
    setState(() {

    });
  }
  void loadSuraFile1(int index)async{
    String content=await rootBundle.loadString('assets/files/Suras/${index+1}.txt');
    List<String> lines=content.split('\n');
    verses=lines;
  }
}



