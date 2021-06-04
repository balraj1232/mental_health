import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

Widget listTileCafe1(BuildContext context,
    String contactName,
    String time,
    ){
  SizeConfig().init(context);
  return Container(
    //color: Colors.blue[900],
    margin: EdgeInsets.only(
      bottom: SizeConfig.blockSizeVertical * 2,
      right: SizeConfig.screenWidth * 0.05
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.screenWidth * 0.1,
          child: Text(time,style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w400
          ),),
        ),
        Container(
          width: SizeConfig.screenWidth * 0.45,
          child: Text(contactName,style: GoogleFonts.openSans(
            color: Color(fontColorGray),
            fontWeight: FontWeight.w400
          ),),
        ),
        Container(
          width: SizeConfig.screenWidth * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icons/Ellipse 3.png'),
                  fit: BoxFit.cover
                )
              ),
              child: Image.asset('assets/icons/call.png',
              scale: SizeConfig.blockSizeVertical * 0.5,),
              padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
            ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/icons/Ellipse 3.png'),
                        fit: BoxFit.cover
                    )
                ),
                child: Image.asset('assets/icons/video call.png',
                  scale: SizeConfig.blockSizeVertical * 0.5,),
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.8),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}