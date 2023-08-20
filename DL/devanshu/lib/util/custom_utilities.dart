import 'dart:ui';

import 'package:flutter/material.dart';

class CustomUtilities {
  Color lightGreenColor = Colors.green.shade50;
  Color greenColor = Color.fromRGBO(8, 111, 68, 1);
  Color backgroundGreyColor = Colors.grey.shade200;
  Color backgroundLightGreyColor = Colors.grey.shade50;

  double screenWidth = 0.0;
  double screenHeight = 0.0;

  void setScreenSize(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
