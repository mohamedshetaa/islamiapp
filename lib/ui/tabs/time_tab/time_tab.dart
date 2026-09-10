import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/ui/tabs/time_tab/azkar.dart';
import 'package:islami/ui/tabs/time_tab/cursol_container.dart';
import 'package:islami/utils/islami_assets.dart';
import 'package:islami/utils/islami_colors.dart';
import 'package:islami/utils/islami_size.dart';
import 'package:islami/utils/islami_styles.dart';
class TimeScreen extends StatefulWidget {
  @override
  State<TimeScreen> createState() => _TimeScreenState();
}
class _TimeScreenState extends State<TimeScreen> {
  bool isMuted=false;
  final List<Map<String, String>> prayerTimes = [
    {'name': 'Fajr', 'time': '04:48 AM'},
    {'name': 'Sunrise', 'time': '06:15 AM'},
    {'name': 'Dhuhr', 'time': '12:07 PM'},
    {'name': 'Asr', 'time': '03:28 PM'},
    {'name': 'Maghrib', 'time': '05:58 PM'},
    {'name': 'Isha', 'time': '07:16 PM'},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(spacing: IslamiSize.height(context)*0.01,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: IslamiSize.width(context)*0.03),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(IslamiAssets.c_cover), fit: BoxFit.fill),
                color: IslamiColors.dark_goldColor,
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: IslamiSize.height(context) * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('8 Mar,', style: IslamiStyles.bold16white),
                          Text('2026', style: IslamiStyles.bold16white)
                        ],
                      ),
                      Column(
                        children: [
                          Text('Pray Time', style: IslamiStyles.bold20black),
                          Text('Sunday', style: IslamiStyles.bold20black)
                        ],
                      ),
                      Column(
                        children: [
                          Text('18 Ram,', style: IslamiStyles.bold16white),
                          Text('1447', style: IslamiStyles.bold16white)
                        ],
                      )
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: prayerTimes.length,
                  itemBuilder: (context, index, realIndex) {
                    final timeParts = prayerTimes[index]['time']!.split(' ');
                    return CursolContainer(
                      index: index,
                      prayerTimes: prayerTimes,
                      timeParts: timeParts,
                    );
                  },
                  options: CarouselOptions(
                    height: IslamiSize.height(context) * 0.15,
                    viewportFraction: 0.26,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    initialPage: 3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width:IslamiSize.width(context)*0.15 ,),
                    Text('Next Pray - 02:32',
                    style: IslamiStyles.bold16white.copyWith(
                      color: IslamiColors.darkBackgroundColor
                    ),
                    ),
                    SizedBox(width:IslamiSize.width(context)*0.15 ,),
                    IconButton(onPressed: (){
                      isMuted=!isMuted;
                      setState(() {
                      });
                    },
                        icon: isMuted==false? SvgPicture.asset(IslamiAssets.volume):SvgPicture.asset(IslamiAssets.no_volume))
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: IslamiSize.width(context)*0.03),
          child: Text('Azkar',
          style: IslamiStyles.bold16white,),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: IslamiSize.width(context)*0.03),
          child: Row(
            spacing: IslamiSize.width(context)*0.02,
            children: [
            Azkar(azkar_name: 'Evening Azkar', pic: IslamiAssets.m_azkar),
              Azkar(azkar_name: 'Morning Azkar', pic: IslamiAssets.e_azkar)
            ],
          ),
        )
      ],
    );
  }
}



