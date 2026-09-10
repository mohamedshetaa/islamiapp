import 'package:flutter/material.dart';
import '../../utils/islami_assets.dart';
import '../../utils/islami_colors.dart';
import '../widgets/chosen_screen.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int current_index=0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(IslamiAssets.background_image[current_index],
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Image.asset(IslamiAssets.logo,),
                Expanded(child: chosenScreen(current_index))
              ],
            )
            ,bottomNavigationBar:
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: IslamiColors.goldColor,
              ),
              child: BottomNavigationBar(
                onTap: (index){
                  current_index=index;
                  setState(() {
                  });
                },
                 currentIndex: current_index,
                  items: [
                BottomNavigationBarItem(icon: bottomIconBar(0, IslamiAssets.quran_icon),label: 'Quran'),
                    BottomNavigationBarItem(icon: bottomIconBar(1, IslamiAssets.hadeeth_icon),label: 'Hadeeth'),
                    BottomNavigationBarItem(icon: bottomIconBar(2, IslamiAssets.sebha_icon),label: 'Sebha'),
                    BottomNavigationBarItem(icon: bottomIconBar(3, IslamiAssets.radio_icon),label: 'Radio'),
                    BottomNavigationBarItem(icon: bottomIconBar(4, IslamiAssets.time_icon),label: 'Time'),
          
              ]),
            ) ,
          ),
        )
      ],
    );
  }
  Widget bottomIconBar(int index,String iconName)
  {
    return (index==current_index)?
     Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color:IslamiColors.shadow,
      ),
      padding: EdgeInsets.symmetric(horizontal:20,vertical:6 ),
      child:ImageIcon(AssetImage(iconName)) ,
    ): ImageIcon(AssetImage(iconName));
  }

}





