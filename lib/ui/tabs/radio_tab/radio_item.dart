import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../islami_rescources/resources.dart';
import '../../../utils/islami_assets.dart';
import '../../../utils/islami_colors.dart';
import '../../../utils/islami_size.dart';
import '../../../utils/islami_styles.dart';

class RadioItem extends StatelessWidget {
  final bool isReciter;
  final bool isRadio;

  const RadioItem({super.key, required this.isRadio, required this.isReciter});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return RadioCard(
            isRadio: isRadio,
            isReciter: isReciter,
            index: index,
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(height: IslamiSize.height(context) * 0.02),
        itemCount: 4,
      ),
    );
  }
}

class RadioCard extends StatefulWidget {
  final bool isReciter;
  final bool isRadio;
  final int index;

  const RadioCard({
    super.key,
    required this.isRadio,
    required this.isReciter,
    required this.index,
  });

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  bool play = false;
  bool volume=true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: IslamiSize.width(context) * 0.02,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: IslamiColors.goldColor),
        child: Column(
          children: [
            SizedBox(
              height: IslamiSize.height(context) * 0.02,
            ),
            Text(
              widget.isRadio && widget.isReciter == false
                  ? Resources.radioList[widget.index]
                  : Resources.reciterList[widget.index],
              style: IslamiStyles.bold20black,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                play==false?
                Image.asset(
                  IslamiAssets.mosque2,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ): Image.asset(
                  IslamiAssets.sound_wave,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding:
                  EdgeInsets.only(top: IslamiSize.height(context) * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: IslamiSize.width(context) * 0.13,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              play = !play;
                            });
                          },
                          icon: play == false
                              ? SvgPicture.asset(
                            IslamiAssets.play,
                            width: IslamiSize.width(context) * 0.07,
                          )
                              : SvgPicture.asset(
                            IslamiAssets.pause,
                            width: IslamiSize.width(context) * 0.07,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if(play){
                              volume=!volume;}
                            });
                          },
                          icon:volume? SvgPicture.asset(
                            IslamiAssets.volume,
                            width: IslamiSize.width(context) * 0.07,
                          ):SvgPicture.asset(
                            IslamiAssets.no_volume,
                            width: IslamiSize.width(context) * 0.07,
                          )
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}




