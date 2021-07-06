import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/DrawerMenu.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  List<String> images = ['assets/bg/gridCard1.png',
    'assets/bg/gridCard2.png',
    'assets/bg/gridCard1.png',
    'assets/bg/gridCard4.png','assets/bg/gridCard4.png','assets/bg/gridCard4.png'];

  List<Color> colors = [Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75)];

  List<String> desc = ["How to have a\npeaceful mind",
    "Worlds of the\nwaterfall",
    "How to have a\npeaceful mind",
    "Worlds of the\nwaterfall","Worlds of the\nwaterfall","Worlds of the\nwaterfall"];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/bg/Frame.png'),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        actions: [
                          Container(
                            margin:EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5),
                            child: Icon(Icons.notifications_none_sharp,
                              color: Colors.white,),
                          ),
                        ],
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical
                        ),
                        child: Text("Hello,",
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeVertical * 3
                            )),
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical
                        ),
                        child: Text("Dr. Sushmita,",
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeVertical * 3.5
                            )),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed('/KYC');
                        },
                        child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.blockSizeVertical * 5,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical,
                          ),
                          decoration: BoxDecoration(
                              color: Color(skyBlue),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Complete your KYC to Start taking bookings",
                            style: GoogleFonts.openSans(
                                color: Color(backgroundColorBlue),
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.3
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(65)
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3.5,
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical
                        ),
                        child: Text("LEARN",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              color: Color(fontColorGray)
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.02,
                            vertical: SizeConfig.blockSizeVertical * 2
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8
                          ), itemBuilder: (BuildContext context, int index){
                          return Container(
                            width: SizeConfig.screenWidth * 0.4,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: Image.asset(images[index]).image,
                                  fit: BoxFit.cover
                              ),
                            ),
                            child: Container(
                              width: SizeConfig.screenWidth,
                              padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.02,
                                  right: SizeConfig.screenWidth * 0.02
                              ),
                              height: SizeConfig.blockSizeVertical * 8,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: colors[index],
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(desc[index],
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  Text("3m",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                    ),),
                                ],
                              ),
                            ),
                          );
                        },
                          itemCount: images.length,),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerMenu(),
      bottomNavigationBar: NavigationBar(index: 0,),
    ));
  }
}
