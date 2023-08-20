import 'dart:async';
import 'package:devanshu/homepage.dart';
import 'package:devanshu/util/custom_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CustomUtilities utilities = CustomUtilities();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    utilities.setScreenSize(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: utilities.screenHeight * 0.9,
            child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                  top: utilities.screenHeight * 0.15,
                ),
                child: Image.asset("assets/images/common/logo_rect.png")),
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.8,
                image: AssetImage("assets/images/common/medical_splash.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            height: utilities.screenHeight * 0.1,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      "assets/images/common/DU_Logo.png",
                      height: utilities.screenHeight * 0.1,
                      width: utilities.screenWidth * 0.48,
                    ),
                  ),
                ),
                // ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Image.asset(
                      "assets/images/common/logo_aswdc.png",
                      height: utilities.screenHeight * 0.1,
                      width: utilities.screenWidth * 0.48,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
