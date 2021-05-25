import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Color(backgroundColorBlue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.screenHeight * 0.35,
            ),
            alignment: Alignment.center,
            child: Image.asset('assets/logo/Group.png',
            width: SizeConfig.screenWidth * 0.4,
            height: SizeConfig.screenHeight * 0.25,),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('/Login');
            },
            child: Text("©2021 SAL Foundation.",
            style: TextStyle(color: Color(copyrightTextColor),
            fontWeight: FontWeight.w400),),
          ),
        ],
      )
    ));
  }
}
