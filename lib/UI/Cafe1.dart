import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/ListTileCafe1.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Cafe1 extends StatefulWidget {
  const Cafe1({Key key}) : super(key: key);

  @override
  _Cafe1State createState() => _Cafe1State();
}

class _Cafe1State extends State<Cafe1> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("UPCOMING",style: GoogleFonts.openSans(
                    color: Color(0XFF0066B3),
                    fontWeight: FontWeight.w700
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/Cafe2');
                    },
                    child: Text("PAST",style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w600
                    ),),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth * 0.45,
                  height: SizeConfig.blockSizeVertical * 0.3,
                  color: Color(backgroundColorBlue),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.45,
                  height: SizeConfig.blockSizeVertical * 0.3,
                  color: Color(fontColorGray),
                ),
              ],
            ),
            Text("TODAY",style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            listTileCafe1(context,"Kriti Singh","17:00"),
            listTileCafe1(context,"Suman Roy","18:00"),
            Text("YESTERDAY",style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            listTileCafe1(context,"Ananya Rawat","18:00"),
            listTileCafe1(context,"Suman Roy","18:00"),
            listTileCafe1(context,"Suman Roy","18:00"),
            listTileCafe1(context,"Suman Roy","18:00"),
            listTileCafe1(context,"Suman Roy","18:00"),
            listTileCafe1(context,"Suman Roy","18:00"),
            listTileCafe1(context,"Suman Roy","18:00"),
            Text("30 JUL 2020",style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            listTileCafe1(context,"Suman Roy","18:00"),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        currentIndex: 1,
        unselectedItemColor: Color(fontColorGray),
        selectedLabelStyle: GoogleFonts.openSans(
          color: Colors.blue,
        ),
        unselectedLabelStyle: GoogleFonts.openSans(
          color: Color(fontColorGray)
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Container(child: 
          Image.asset('assets/icons/nav home.png',
          scale: SizeConfig.blockSizeVertical * 0.4,),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5)
          ),
          padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
          label: "Home"),
          BottomNavigationBarItem(icon: Container(child:
          Image.asset('assets/icons/nav booking.png',
            scale: SizeConfig.blockSizeVertical * 0.4,),
            decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
              label: "Booking"),
          BottomNavigationBarItem(icon: Container(child:
          Image.asset('assets/icons/nav explore.png',
            scale: SizeConfig.blockSizeVertical * 0.4,),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
              label: "Explore"),
          BottomNavigationBarItem(icon: Container(child:
          Image.asset('assets/icons/nav cafe.png',
            scale: SizeConfig.blockSizeVertical * 0.4,),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
              label: "Cafe"),

        ],

      ),
    ));
  }
}
