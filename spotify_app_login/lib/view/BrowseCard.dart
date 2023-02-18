import 'package:flutter/material.dart';

import '../json/hexColor.dart';
class BrowseCard extends StatelessWidget {
  const BrowseCard({Key? key, required this.title, required this.color1}) : super(key: key);
  final String title;
  final Color color1 ;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return   Container(
      width: size.width / 2.25,
      height : 90,
      padding: EdgeInsets.symmetric(horizontal: 9 , vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        color: color1,
      ),
      child:  Text( title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700
        ),),
    );
  }
}
