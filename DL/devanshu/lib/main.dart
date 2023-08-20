import 'package:devanshu/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // dynamic defaultFontFamily = System.


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // textTheme: TextTheme(),
        // primarySwatch: Colors.green,
        // appBarTheme: AppBarTheme(color: Color.fromRGBO(8, 111, 68, 1),),
      ),
      home: SplashScreen(),);
  }
}
