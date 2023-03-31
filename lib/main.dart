import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:gjustit3/common/color.dart';
import 'package:gjustit3/pages/Homepage/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "product",
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset("asstes/images/logo.png"),
        ),
        backgroundColor: AppColor.backgroundColor,
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: const Duration(seconds: 2),
        // pageTransitionType: PageTransitionType.scale,
        duration: 2000,
      ),
    );
  }
}
