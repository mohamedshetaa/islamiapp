import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/utils/islami_size.dart';

import 'hadeeth_component.dart';


class HadeethScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return  CarouselSlider(
      options: CarouselOptions(height: IslamiSize.height(context)*0.66,
        enlargeCenterPage: true,
        reverse: true
      ),
      items: List.generate(50, (index)=>index+1).map((index) {
       return HadeethComponent(index: index);
      }).toList(),
    );
  }
}



