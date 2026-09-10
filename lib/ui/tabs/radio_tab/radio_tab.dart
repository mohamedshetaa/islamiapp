import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/islami_rescources/resources.dart';
import 'package:islami/ui/tabs/radio_tab/radio_item.dart';
import 'package:islami/utils/islami_assets.dart';
import 'package:islami/utils/islami_colors.dart';
import 'package:islami/utils/islami_size.dart';
import 'package:islami/utils/islami_styles.dart';

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isRadio=true;
  bool isReciter=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){isRadio=true;
                isReciter=false;
                setState(() {

                });
                },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:
                IslamiSize.width(context)*0.02),
                child: Container(
                  padding:EdgeInsets.symmetric(
                    horizontal:IslamiSize.width(context)*0.008 ,
                    vertical:IslamiSize.height(context)*0.009
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isRadio&&isReciter==false?IslamiColors.goldColor:IslamiColors.darkBackgroundColor,
                  ),
                  child: Text('Radio',
                  style: isRadio&&isReciter==false?IslamiStyles.bold16white.copyWith(
                    color: IslamiColors.darkBackgroundColor
                  ):IslamiStyles.bold16white.copyWith(
                   fontWeight: FontWeight.w400
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: GestureDetector(
            onTap: (){isRadio=false;
              isReciter=true;
              setState(() {

              });
              },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:
              IslamiSize.width(context)*0.02),
              child: Container(
                  padding:EdgeInsets.symmetric(
                  horizontal:IslamiSize.width(context)*0.008 ,
                  vertical:IslamiSize.height(context)*0.009),
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                  color: isRadio==false&&isReciter?IslamiColors.goldColor:IslamiColors.darkBackgroundColor,
                ),
                  child: Text('Reciters',
                  style: isRadio==false&&isReciter?IslamiStyles.bold16white.copyWith(
                  color: IslamiColors.darkBackgroundColor
                  ):IslamiStyles.bold16white.copyWith(
                  fontWeight: FontWeight.w400
                  ),
                    textAlign: TextAlign.center,
              )),
            ),
          )
          )],
      ),
        SizedBox(height: IslamiSize.height(context)*0.02),
      RadioItem(isRadio: isRadio, isReciter: isReciter)
      ],
    );
  }
}



