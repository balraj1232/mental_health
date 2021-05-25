import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Price1 extends StatefulWidget {
  const Price1({Key key}) : super(key: key);

  @override
  _Price1State createState() => _Price1State();
}

class _Price1State extends State<Price1> {

  int radioValue = -1;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("1/7",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
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
              value: 0.1,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("I am a...",style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)
                  ),),
                  Image.asset('assets/icons/info.png',
                  height: SizeConfig.blockSizeVertical * 4,)
                ],
              ),
            ),
            Container(
              child: RadioListTile(
                  value: 1, groupValue: radioValue, onChanged: (value){
                    setState(() {
                      radioValue = value;
                    });
              },
              title: Text("Counselling Therapist",style: TextStyle(
                color: Color(fontColorGray)
              ),),),
            ),
            Container(
              child: RadioListTile(
                value: 2, groupValue: radioValue, onChanged: (value){
                setState(() {
                  radioValue = value;
                });
              },
                title: Text("Listener",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
            Container(
              child: RadioListTile(
                value: 3, groupValue: radioValue, onChanged: (value){
                setState(() {
                  radioValue = value;
                });
              },
                title: Text("Alternative Therapist",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.25,
              ),
              alignment: Alignment.bottomRight,
              child: InkWell(child: Image.asset('assets/icons/next icon.png',width: SizeConfig.blockSizeHorizontal * 20,),
              onTap: (){
                Navigator.of(context).pushNamed('/Price2');
              },),
            ),

          ],
        ),
      ),
    ));
  }
}
