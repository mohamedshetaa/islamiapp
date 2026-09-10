import 'package:flutter/material.dart';
import 'package:islami/utils/islami_assets.dart';
import '../../utils/islami_colors.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;

    double widthScale(double value) => sw * (value / 430);
    double heightScale(double value) => sh * (value / 932);

    return Scaffold(
      backgroundColor: IslamiColors.darkBackgroundColor,
      body: IntroductionScreen(
        globalHeader: Image.asset(
          IslamiAssets.logo,
        ),
        globalBackgroundColor: IslamiColors.darkBackgroundColor,
        pages: [
          // Page 1
          _buildPage(
            context,
            imagePath: IslamiAssets.welcome1,
            title: 'Welcome To Islami App',
            body: '',
          ),
          // Page 2
          _buildPage(
            context,
            imagePath: IslamiAssets.welcome2,
            title: 'Welcome To Islami',
            body: 'We Are Very Excited To Have You In Our Community',
          ),
          // Page 3
          _buildPage(
            context,
            imagePath: IslamiAssets.welcome3,
            title: 'Reading the Quran',
            body: 'Read, and your Lord is the Most Generous',
          ),
          // Page 4
          _buildPage(
            context,
            imagePath: IslamiAssets.welcome4,
            title: 'Bearish',
            body: 'Praise the name of your Lord, the Most High',
          ),
          // Page 5
          _buildPage(
            context,
            imagePath: IslamiAssets.welcome5,
            title: 'Holy Quran Radio',
            body: 'You can listen to the Holy Quran Radio through the application for free and easily',
          ),
        ],
        onDone: () {
          Navigator.pushReplacementNamed(context, 'home_screen');(

          );
        },
        showBackButton: true,
        back: Text("Back",
            style: TextStyle(
                color: IslamiColors.goldColor,
                fontWeight: FontWeight.bold,
                fontSize: widthScale(16))),
        showSkipButton: false,
        next: Text("Next",
            style: TextStyle(
                color: IslamiColors.goldColor,
                fontWeight: FontWeight.bold,
                fontSize: widthScale(16))),
        done: Text("Finish",
            style: TextStyle(
                color: IslamiColors.goldColor,
                fontWeight: FontWeight.bold,
                fontSize: widthScale(16))),
        dotsFlex: 2,
        nextFlex: 1,
        skipOrBackFlex: 1,
        controlsPadding: EdgeInsets.symmetric(
          horizontal: widthScale(16),
          vertical: heightScale(8),
        ),
        dotsDecorator: DotsDecorator(
          size: Size(widthScale(10), widthScale(10)),
          color: Colors.grey,
          activeColor: IslamiColors.goldColor,
          activeSize: Size(widthScale(22), widthScale(10)),
          spacing: EdgeInsets.symmetric(horizontal: widthScale(3)),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(widthScale(25))),
          ),
        ),
      ),
    );
  }

  PageViewModel _buildPage(BuildContext context,
      {required String imagePath, required String title, String body = ""}) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;

    double widthScale(double value) => sw * (value / 430);
    double heightScale(double value) => sh * (value / 932);

    return PageViewModel(
      title: "",
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: heightScale(120)),
          Image.asset(
            imagePath,
          ),
          SizedBox(height: heightScale(24)),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: IslamiColors.goldColor,
              fontSize: widthScale(24),
              fontWeight: FontWeight.bold,
            ),
          ),
          if (body.isNotEmpty) ...[
            SizedBox(height: heightScale(24)),
            Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: IslamiColors.goldColor,
                fontSize: widthScale(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
      decoration: const PageDecoration(
        pageColor: Colors.transparent,
        bodyAlignment: Alignment.center,
        contentMargin: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}




