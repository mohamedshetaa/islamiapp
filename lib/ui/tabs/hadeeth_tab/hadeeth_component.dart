import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/tabs/hadeeth_tab/hadeeth_args.dart';
import 'package:islami/ui/tabs/hadeeth_tab/hadeeth_item.dart';
import 'package:islami/utils/islami_assets.dart';
import 'package:islami/utils/islami_size.dart';
import 'package:islami/utils/islami_styles.dart';

import '../../../utils/islami_colors.dart';

class HadeethComponent extends StatefulWidget {
  int index;
   HadeethComponent({super.key,required this.index});

  @override
  State<HadeethComponent> createState() => _HadeethComponentState();
}

class _HadeethComponentState extends State<HadeethComponent> {
  HadeethItem? hadeeth;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadeethFile();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Navigator.of(context).pushNamed('hadeeth_details',
          arguments:HadeethArgs(hadeethItem: hadeeth, index: widget.index)
          );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IslamiAssets.had_bg),
          ),
          color: IslamiColors.goldColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child:hadeeth==null?Center(child: CircularProgressIndicator(
          color: IslamiColors.darkBackgroundColor,
        )):Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:IslamiSize.width(context)*0.02 ,
                vertical: IslamiSize.height(context)*0.02
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(IslamiAssets.left__corner),
                  Expanded(
                    child: Text(hadeeth!.title,
                    style: IslamiStyles.bold20black.copyWith(
                      fontSize: 24,
                    ),
                    textAlign:TextAlign.center,
                      ),
                  ),
                  Image.asset(IslamiAssets.right__corner)
                ],
              ),
            ),
            Expanded(child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: IslamiSize.width(context)*0.04
              ),
              child: SingleChildScrollView(
                child: Text(hadeeth!.hadeeth_content,
                textAlign: TextAlign.center,
                style: IslamiStyles.bold16white.copyWith(
                  color: IslamiColors.darkBackgroundColor
                ),),
              ),
            )),
            Image.asset(IslamiAssets.mosque2)
          ],
        ) ,
      ),
    );
  }

  void loadHadeethFile() async{
    String hadeeth_content=await rootBundle.loadString('assets/files/Hadeeth/h${widget.index}.txt');
    String title=hadeeth_content.substring(0,hadeeth_content.indexOf('\n'));
    String content=hadeeth_content.substring(hadeeth_content.indexOf('\n')+1);
    hadeeth=HadeethItem(title: title, hadeeth_content: content);
    setState(() {

});

  }
}





