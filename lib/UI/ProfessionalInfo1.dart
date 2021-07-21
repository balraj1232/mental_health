import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

bool anxiety = false;
bool relationship = false;
bool depression = false;
bool grief = false;
bool lifeCoaching = false;
bool anger = false;
bool parenting = false;
bool stress = false;
bool motivation = false;
bool others = false;
bool selected = false;


class ProfessionalInfo1 extends StatefulWidget {
  const ProfessionalInfo1({Key key}) : super(key: key);

  @override
  _ProfessionalInfo1State createState() => _ProfessionalInfo1State();
}

class _ProfessionalInfo1State extends State<ProfessionalInfo1> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("4/8",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),),
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),onTap: (){
          Navigator.pop(context);
        },),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              value: 0.4,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text("What's your areas of expertise?",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 4,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        anxiety = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Anxiety Management",style: GoogleFonts.openSans(
                        color: anxiety == true && selected == true ? Colors.white : Color(fontColorGray),
                        fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: anxiety == true && selected == true ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: anxiety == true && selected == true ? Colors.blue : Color(fontColorGray),
                          width: 1.0
                        )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        relationship == true?false:true;
                       // selected = true?false:true;
                      });
                    },
                    child: Container(
                      child: Text("Relationship",style: GoogleFonts.openSans(
                          color: relationship == true  ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: relationship == true  ? Colors.blue : Colors.white,
                          border: Border.all(
                              color:relationship == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        depression = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Depression",style: GoogleFonts.openSans(
                          color: depression == true && selected == true? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: depression == true && selected == true? Colors.blue : Colors.white,
                          border: Border.all(
                              color: depression == true && selected == true? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        grief = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Grief",style: GoogleFonts.openSans(
                          color: grief==true && selected == true?Colors.white:Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: grief == true && selected == true?Colors.blue:Colors.white,
                          border: Border.all(
                              color: grief == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        lifeCoaching = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Life Coaching",style: GoogleFonts.openSans(
                          color: lifeCoaching==true && selected == true? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: lifeCoaching == true && selected == true? Colors.blue : Colors.white,
                          border: Border.all(
                              color: lifeCoaching == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        anger = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Anger Management",style: GoogleFonts.openSans(
                          color: anger == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: anger == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: anger == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        parenting = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Parenting",style: GoogleFonts.openSans(
                          color: parenting == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: parenting == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: parenting == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 6,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical,
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        stress = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Stress",style: GoogleFonts.openSans(
                          color: stress == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: stress == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: stress == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        motivation = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Self Motivation",style: GoogleFonts.openSans(
                          color:motivation == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: motivation == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: motivation == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        others = true;
                        selected = true;
                      });
                    },
                    child: Container(
                      child: Text("Others",style: GoogleFonts.openSans(
                          color: others == true && selected == true ? Colors.white : Color(fontColorGray),
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: others == true && selected == true ? Colors.blue : Colors.white,
                          border: Border.all(
                              color: others == true && selected == true ? Colors.blue : Color(fontColorGray),
                              width: 1.0
                          )
                      ),
                      height: SizeConfig.blockSizeVertical * 5,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        right: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        backgroundColor: selected == true? Colors.blue : Colors.grey,
        onPressed: (){
          if(selected)
          Navigator.of(context).pushNamed('/ProfessionalInfo2');
          else
            toast("Please select your expertise areas");
        },
      ),
    ));
  }
}
