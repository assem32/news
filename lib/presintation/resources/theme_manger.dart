import 'package:flutter/material.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/font_manger.dart';
import 'package:news/presintation/resources/style_manger.dart';

ThemeData getTheme(){
  return ThemeData(
    textTheme: TextTheme(
      displayLarge: getBoldStyle(color: ColorManger.headLine,fontSize: FontSizeManger.s20),
      displayMedium: getBoldStyle(color: ColorManger.mainColor,fontSize: FontSizeManger.s20),
      displaySmall: getBoldStyle(color: ColorManger.mainColor,fontSize: FontSizeManger.s14),
      titleSmall: getRegular(color: ColorManger.mainColor,fontSize: FontSizeManger.s12),
      bodyLarge: getRegular(color: ColorManger.secColor,fontSize:FontSizeManger.s12),
      bodyMedium: getRegular(color: ColorManger.lightGrey,fontSize:FontSizeManger.s12),
      bodySmall: getRegular(color: ColorManger.white,fontSize:FontSizeManger.s12)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorManger.headLine,
       unselectedItemColor: ColorManger.secColor
    ),
  );
}

ThemeData getThemeDark(){
  return ThemeData(

      scaffoldBackgroundColor: Colors.black.withOpacity(0.5),
      cardColor: Color(0xff1D1D1D),
      textTheme: TextTheme(
          displayLarge: getBoldStyle(color: ColorManger.headLine,fontSize: FontSizeManger.s20),
          displayMedium: getBoldStyle(color: ColorManger.white,fontSize: FontSizeManger.s20),
          displaySmall: getBoldStyle(color: ColorManger.white,fontSize: FontSizeManger.s14),
          titleSmall: getRegular(color: ColorManger.white,fontSize: FontSizeManger.s12),
          bodyLarge: getRegular(color: ColorManger.secColor,fontSize:FontSizeManger.s12),
          bodyMedium: getRegular(color: ColorManger.lightGrey,fontSize:FontSizeManger.s12),
          bodySmall: getRegular(color: ColorManger.white,fontSize:FontSizeManger.s12)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManger.mainColor,
          selectedItemColor: ColorManger.headLine,
          unselectedItemColor: ColorManger.secColor
      )
  );
}