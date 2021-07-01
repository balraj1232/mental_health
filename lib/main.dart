import 'package:flutter/material.dart';
import 'package:mental_health/UI/Assessments.dart';
import 'package:mental_health/UI/Availabilty.dart';
import 'package:mental_health/UI/Cafe1.dart';
import 'package:mental_health/UI/Cafe2.dart';
import 'package:mental_health/UI/Cafe3.dart';
import 'package:mental_health/UI/ExploreAll.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/UI/HomeMain.dart';
import 'package:mental_health/UI/Info%203.dart';
import 'package:mental_health/UI/Info1.dart';
import 'package:mental_health/UI/Info2.dart';
import 'package:mental_health/UI/KYCScreen.dart';
import 'package:mental_health/UI/MyContent.dart';
import 'package:mental_health/UI/MyProfile.dart';
import 'package:mental_health/UI/OTPScreen.dart';
import 'package:mental_health/UI/Price1.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/UI/Price3.dart';
import 'package:mental_health/UI/Price4.dart';
import 'package:mental_health/UI/Price5.dart';
import 'package:mental_health/UI/ProfessionalInfo1.dart';
import 'package:mental_health/UI/ProfessionalInfo2.dart';
import 'package:mental_health/UI/SplashScreen.dart';
import 'UI/CancelAppointment.dart';
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
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      home: SplashScreen(),
      routes: {
        '/Login': (context) => LoginScreen(),
        '/OTP': (context) => OTPScreen(),
        '/Price1': (context) => Price1(),
        '/Price2': (context) => Price2(),
        '/Price3': (context) => Price3(),
        '/ProfessionalInfo1': (context) => ProfessionalInfo1(),
        '/ProfessionalInfo2': (context) => ProfessionalInfo2(),
        '/Info1': (context) => Info1(),
        '/Info2': (context) => Info2(),
        '/Info3': (context) => Info3(),
        '/Price4': (context) => Price4(),
        '/Price5': (context) => Price5(),
        '/Cafe1' : (context)=> Cafe1(),
        '/Cafe2' : (context)=> Cafe2(),
        '/Cafe3' : (context)=> Cafe3(),
        '/CancelAppointment' : (context)=> CancelAppointment(),
        '/MyProfile' : (context)=> MyProfile(),
        '/MyContent' : (context)=> MyContent(),
        '/Home2' : (context)=> Home2(),
        '/KYC' : (context)=> KYCScreen(),
        '/HomeMain' : (context)=> HomeMain(),
        '/ExploreAll' : (context)=> ExploreAll(),
        '/Availability1' : (context)=> Availability(),
        '/Assessments' : (context)=> Assessments(),
      },
    );
  }
}
