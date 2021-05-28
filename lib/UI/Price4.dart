import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Price4 extends StatefulWidget {
  const Price4({Key key}) : super(key: key);

  @override
  _Price4State createState() => _Price4State();
}

class _Price4State extends State<Price4> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Summary",style: GoogleFonts.openSans(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
        centerTitle: true,
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth * 0.05,
          right: SizeConfig.screenWidth * 0.05,
          top: SizeConfig.blockSizeVertical * 3,
        ),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 0.9,
              offset: Offset.fromDirection(2,1),
            )],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: (){},
              color: Colors.white,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text("EDIT",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Color(fontColorGray)
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/Price5');
              },
              color: Colors.blue,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text("SUBMIT",style: GoogleFonts.openSans(
                color: Colors.white,
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Colors.blue
                ),
              ),
            ),
          ],
        ),),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 5,
                right: SizeConfig.screenWidth * 0.05,
                left: SizeConfig.screenWidth * 0.05,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage('assets/icons/user bg.png'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 4,
                    ),
                    Image.asset('assets/icons/user.png',color: Colors.grey,
                      scale: SizeConfig.blockSizeVertical * 0.7,),
                    Container(child: Icon(Icons.add_circle,color: Colors.blue,
                      size: SizeConfig.blockSizeVertical * 5,),
                      alignment: Alignment.centerRight,),
                  ],
                ),
                radius: SizeConfig.blockSizeVertical * 8,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 5,
                right: SizeConfig.screenWidth * 0.05,
                left: SizeConfig.screenWidth * 0.05,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Sushmita Sinha",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeVertical * 2.5
                  ),),
                  Text("Counselling Therapist",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.blockSizeVertical * 2
                  ),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 4,
                bottom: SizeConfig.blockSizeVertical * 4
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("Female",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Languages",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("English, Hindi",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Areas Of Expertise",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("Anxiety Management, Life Coaching",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Qualification",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("Clinical Psychologist",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Experience",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("10 Years",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Qualification Certificate",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("File_name.pdf",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
