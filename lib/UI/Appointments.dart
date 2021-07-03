import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/CommonWidgets.dart';
import 'package:mental_health/Utils/ListTileCafe1.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key key}) : super(key: key);

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  Future<void> _launched;
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
            listTileCafe1(context,"Kriti Singh","17:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
            listTileCafe1(context,"Suman Roy","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839',);
              });
            }),
            Text("YESTERDAY",style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            listTileCafe1(context,"Ananya Rawat","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
            listTileCafe1(context,"Suman Roy","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
            listTileCafe1(context,"Suman Roy","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
            listTileCafe1(context,"Suman Roy","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
            listTileCafe1(context,"Suman Roy","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
            listTileCafe1(context,"Suman Roy","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
            listTileCafe1(context,"Suman Roy","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
            Text("30 JUL 2020",style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            listTileCafe1(context,"Suman Roy","18:00",(){
              setState(() {
                _launched = makePhoneCall('tel:9814657839');
              });
            }),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.28,
              color: Color(backgroundColorBlue),
              child: Column(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 3,
                    ),
                    child: CircleAvatar(
                      radius: SizeConfig.blockSizeVertical * 5,
                      backgroundImage: AssetImage('assets/bg/profile.png'),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2
                    ),
                    child: Text("Sushmita Sinha",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2
                    ),),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1.5,
                    ),
                    child: Text("Complete your profile (60%)",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeVertical * 1.5,
                    ),),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1.5,
                      left: SizeConfig.screenWidth * 0.2,
                      right: SizeConfig.screenWidth * 0.2,
                    ),
                    child: LinearProgressIndicator(
                      backgroundColor: Color(midnightBlue),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      value: 0.6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            ListTile(
              title: Text("My Profile"),
              leading: ImageIcon(Image.asset('assets/icons/user.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/MyProfile');
              },
            ),
            ListTile(
              title: Text("My Availability"),
              leading: ImageIcon(Image.asset('assets/icons/availability.png').image),
            ),
            ListTile(
              title: Text("My Content"),
              leading: ImageIcon(Image.asset('assets/icons/content.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/MyContent');
              },
            ),
            ListTile(
              title: Text("Assessments"),
              leading: ImageIcon(Image.asset('assets/icons/assessments.png').image),
            ),
            ListTile(
              title: Text("Payments"),
              leading: ImageIcon(Image.asset('assets/icons/payment.png').image),
            ),
            ListTile(
              title: Text("Help"),
              leading: ImageIcon(Image.asset('assets/icons/help.png').image),
            ),
            ListTile(
              title: Text("About SAL"),
              leading: ImageIcon(Image.asset('assets/icons/about.png').image),
            ),
            ListTile(
              title: Text("Settings"),
              leading: ImageIcon(Image.asset('assets/icons/settings.png').image),
            ),
          ],
        ),
      ),

    ),
    );
  }


}
