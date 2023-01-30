import 'package:flutter/material.dart';

extension SizeExtention on BuildContext{
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double percentWidth(percent) => percent * screenWidth;
  double percentHeight(percent) => percent * screenHeight;
   
}