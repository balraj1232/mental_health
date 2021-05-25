import 'package:flutter/material.dart';
import 'package:mental_health/UI/OTPScreen.dart';
import 'package:mental_health/UI/Price1.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/UI/SplashScreen.dart';

import 'UI/LoginScreen.dart';

void main() {
  runApp(MentalHealth());
}

class MentalHealth extends StatelessWidget {
  const MentalHealth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mental Health",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/Login' : (context)=> LoginScreen(),
        '/OTP' : (context)=> OTPScreen(),
        '/Price1' : (context)=> Price1(),
        '/Price2' : (context)=> Price2(),

      },
    );
  }
}