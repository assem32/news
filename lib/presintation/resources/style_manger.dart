import 'package:flutter/material.dart';
import 'package:news/presintation/resources/font_manger.dart';

TextStyle _getTextStyle(double fontSize,FontWeight fontWeight,Color color){
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontFamilyManger.fontFamily
  );

}
TextStyle getLightStyle({
  double fontSize=FontSizeManger.s12,required color,
}){
  return _getTextStyle(fontSize, FontWeightManger.light, color);
}

TextStyle getRegular({
  double fontSize=FontSizeManger.s12,required color,
}){
  return _getTextStyle(fontSize, FontWeightManger.regular, color);
}

TextStyle getBoldStyle({
  double fontSize=FontSizeManger.s12,required color,
}){
  return _getTextStyle(fontSize, FontWeightManger.bold, color);
}