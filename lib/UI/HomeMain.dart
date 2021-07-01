import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/ListTileAppointment.dart';
import 'package:mental_health/Utils/ListTileCafe1.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

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
      backgroundColor: Colors.white,
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
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.25
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
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05,
                          vertical: SizeConfig.blockSizeVertical
                        ),
                        child: Text("UPCOMING APPOINTMENTS",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            color: Color(fontColorGray)
                        ),),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.05,
                              vertical: SizeConfig.blockSizeVertical * 2
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              listTileAppointment(context, "Kriti Singh", "17:00", (){}),
                              listTileAppointment(context, "Kriti Singh", "17:00", (){}),
                            ],
                          )),
                      Container(
                        margin:EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                        ),
                        child: MaterialButton(
                          onPressed: (){},
                          minWidth: SizeConfig.screenWidth,
                          height: SizeConfig.blockSizeVertical * 6,
                          child: Text("See All",
                          style: GoogleFonts.openSans(
                            color: Color(backgroundColorBlue)
                          ),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: BorderSide(
                              color: Color(backgroundColorBlue)
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.blockSizeVertical * 2
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
                            vertical: SizeConfig.blockSizeVertical
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
              title: Text("Bookings"),
              leading: ImageIcon(Image.asset('assets/icons/availability.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/Cafe1');
              },
            ),
            ListTile(
              title: Text("My Availability"),
              leading: ImageIcon(Image.asset('assets/icons/availability.png').image),
              onTap: (){
                Navigator.of(context).pushNamed('/Availability1');
              },
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
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/Assessments');
              },
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
      bottomNavigationBar: NavigationBar(index: 0,),

    ));
  }
}
