import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/ListTileCafe2.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Cafe2 extends StatefulWidget {
  const Cafe2({Key key}) : super(key: key);

  @override
  _Cafe2State createState() => _Cafe2State();
}

class _Cafe2State extends State<Cafe2> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
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
            scale: SizeConfig.blockSizeVertical * 0.6,),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
              label: "Home"),
          BottomNavigationBarItem(icon: Container(child:
          Image.asset('assets/icons/nav booking.png',
            scale: SizeConfig.blockSizeVertical * 0.6,),
            decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
              label: "Booking"),
          BottomNavigationBarItem(icon: Container(child:
          Image.asset('assets/icons/nav explore.png',
            scale: SizeConfig.blockSizeVertical * 0.6,),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
              label: "Explore"),
          BottomNavigationBarItem(icon: Container(child:
          Image.asset('assets/icons/nav cafe.png',
            scale: SizeConfig.blockSizeVertical * 0.6,),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),),
              label: "Cafe"),
        ],
      ),
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
                  InkWell(
                    child: Text("UPCOMING",style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w600
                    ),),
                    onTap: (){
                      Navigator.of(context).pushNamed('/Cafe1');
                    },
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/Cafe2');
                    },
                    child: Text("PAST",style: GoogleFonts.openSans(
                        color: Color(0XFF0066B3),
                        fontWeight: FontWeight.w700
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
                  color: Color(fontColorGray),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.45,
                  height: SizeConfig.blockSizeVertical * 0.3,
                  color: Color(backgroundColorBlue),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Text("28 JULY 2020",style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            listTileCafe2(context,"Kriti Singh","17:00"),
            listTileCafe2(context,"Suman Roy","18:00"),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Text("27 JULY 2020",style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),),
            listTileCafe2(context,"Kriti Singh","17:00"),
            listTileCafe2(context,"Kriti Singh","17:00"),
            listTileCafe2(context,"Kriti Singh","17:00"),
            listTileCafe2(context,"Kriti Singh","17:00"),

          ],
        ),
      ),
    ));
  }
}
