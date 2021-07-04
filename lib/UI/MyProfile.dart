import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/Info%203.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/UI/Price3.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg/my profile bg.png'),
                        fit: BoxFit.cover
                    ),
                  ),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.4,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        leading: InkWell(child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
                        onTap: (){
                          Navigator.pop(context);
                        },),
                        elevation: 0.0,
                        centerTitle: true,
                        backgroundColor: Colors.transparent,
                        title: Text("My Profile",
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                          ),),
                        /*actions: [
                          Padding(
                            padding:EdgeInsets.only(
                              right: SizeConfig.screenWidth * 0.05,),
                            child: Icon(Icons.edit_outlined,color: Colors.white,),
                          )
                        ],*/
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.15
                          ),
                          width: SizeConfig.screenWidth * 0.25,
                          height: SizeConfig.screenHeight * 0.12,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            child: image.path != null && image.path != "" ? Image.file(
                                File(image.path)):Image.asset('assets/bg/profile.png'),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.center,
                        child: Text(firstNameController.text + " " + lastNameController.text,
                          style: GoogleFonts.openSans(
                              color: Color(backgroundColorBlue),
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Counsellor",
                            style: GoogleFonts.openSans(
                              color: Color(fontColorSteelGrey),
                            ),),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal,
                            ),
                            Image.asset('assets/bg/circle.png',
                            height: SizeConfig.blockSizeVertical * 0.5,),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal,
                            ),
                            Text("4.5", style: GoogleFonts.openSans(
                              color: Color(fontColorSteelGrey),
                            ),
                            ),
                            Image.asset('assets/icons/star.png',
                              height: SizeConfig.blockSizeVertical * 2,)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 4
                        ),
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.blockSizeVertical * 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("500",
                                style: GoogleFonts.openSans(
                                  color: Color(backgroundColorBlue),
                                  fontSize: SizeConfig.blockSizeVertical * 4,
                                  fontWeight: FontWeight.w600
                                ),),
                                Text("PRICE PER \nSESSION",
                                style: GoogleFonts.openSans(
                                  color: Color(fontColorGray),
                                  fontSize:  SizeConfig.blockSizeVertical * 1.5,
                                ),)
                              ],
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 0.2,
                              height: SizeConfig.blockSizeVertical * 9,
                              color: Color(0XFFD8DFE9),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("0",
                                  style: GoogleFonts.openSans(
                                      color: Color(backgroundColorBlue),
                                      fontSize: SizeConfig.blockSizeVertical * 4,
                                      fontWeight: FontWeight.w600
                                  ),),
                                Text("FOLLOW UP \nSESSION",
                                  style: GoogleFonts.openSans(
                                    color: Color(fontColorGray),
                                    fontSize:  SizeConfig.blockSizeVertical * 1.5,
                                  ),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 4,
                          left: SizeConfig.screenWidth * 0.05,
                          right: SizeConfig.screenWidth * 0.05
                        ),
                        child: Text("ABOUT",
                        style: GoogleFonts.openSans(
                          color: Color(fontColorGray),
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeVertical * 2
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical,
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05
                        ),
                        child: Text("${firstNameController.text + " " + lastNameController.text} has been a therapist for many years and believes in helping people wholeheartedly. She wants to provide her services to... see more ",
                          style: GoogleFonts.openSans(
                              color: Color(fontColorGray),
                              fontSize: SizeConfig.blockSizeVertical * 1.75
                          ),
                        textAlign: TextAlign.justify,),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2.5,
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05
                        ),
                        child: Text("AREA OF EXPERTISE",
                          style: GoogleFonts.openSans(
                              color: Color(fontColorGray),
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeVertical * 2
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.05,
                          right: SizeConfig.screenWidth * 0.05,
                          top: SizeConfig.blockSizeVertical
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: 5,
                          spacing: 2,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical * 6,
                              width: SizeConfig.screenWidth * 0.4,
                              alignment: Alignment.center,
                              child: Text("Anxiety Management",
                              style: GoogleFonts.openSans(
                                color: Color(backgroundColorBlue),
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeVertical * 1.75
                              ),),
                              decoration: BoxDecoration(
                                color: Color(0XFFE4F0F8),
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 6,
                              width: SizeConfig.screenWidth * 0.4,
                              alignment: Alignment.center,
                              child: Text("Life Coaching",
                                style: GoogleFonts.openSans(
                                    color: Color(backgroundColorBlue),
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.blockSizeVertical * 1.75
                                ),),
                              decoration: BoxDecoration(
                                  color: Color(0XFFE4F0F8),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 6,
                              width: SizeConfig.screenWidth * 0.4,
                              alignment: Alignment.center,
                              child: Text("Overcoming Grief",
                                style: GoogleFonts.openSans(
                                    color: Color(backgroundColorBlue),
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.blockSizeVertical * 1.75
                                ),),
                              decoration: BoxDecoration(
                                  color: Color(0XFFE4F0F8),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2.5,
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05
                        ),
                        child: Text("LANGUAGES",
                          style: GoogleFonts.openSans(
                              color: Color(fontColorGray),
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeVertical * 2
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.05,
                            right: SizeConfig.screenWidth * 0.05,
                            top: SizeConfig.blockSizeVertical
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: 5,
                          spacing: 2,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical * 6,
                              width: SizeConfig.screenWidth * 0.3,
                              alignment: Alignment.center,
                              child: Text(selectedVal,
                                style: GoogleFonts.openSans(
                                    color: Color(backgroundColorBlue),
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.blockSizeVertical * 1.75
                                ),),
                              decoration: BoxDecoration(
                                  color: Color(0XFFE4F0F8),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    ));
  }
}
