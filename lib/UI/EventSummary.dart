import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class EventSummary extends StatefulWidget {
  const EventSummary({Key key}) : super(key: key);

  @override
  _EventSummaryState createState() => _EventSummaryState();
}

class _EventSummaryState extends State<EventSummary> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0XFFD8DFE9),
              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              height: SizeConfig.screenHeight * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Color(0XFFD8DFE9),
                    elevation: 0.0,
                    leading: InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(midnightBlue),
                      ),
                    ),
                    centerTitle: true,
                    title: Text("Summary",
                    style: TextStyle(
                      color: Color(midnightBlue),
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.03,
                  vertical: SizeConfig.blockSizeVertical),
              child: Text(
                "EVENT NAME",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(fontColorGray),
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.03,
              ),
              child: Text(
                "Work and stress Workshop",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(fontColorGray),
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.03,
                right: SizeConfig.screenWidth * 0.25,
                top: SizeConfig.blockSizeVertical,
                bottom: SizeConfig.blockSizeVertical,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "DATE",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(fontColorGray),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "23 June 2021",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(fontColorGray),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "TIME",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(fontColorGray),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "2:00 - 4:00 PM",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(fontColorGray),
                          ),
                        ),
                      ),
                    ],
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
