import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class ExploreAll extends StatefulWidget {
  const ExploreAll({Key key}) : super(key: key);

  @override
  _ExploreAllState createState() => _ExploreAllState();
}

class _ExploreAllState extends State<ExploreAll> {

  List<String> categories = ['All','Liked','Anxiety','Sleep','Anger'];

  List<String> images = ['assets/bg/gridCard1.png',
    'assets/bg/gridCard2.png',
    'assets/bg/gridCard1.png',
    'assets/bg/gridCard4.png','assets/bg/gridCard4.png','assets/bg/gridCard4.png'];

  List<String> imagesVideos = ['https://wallpaperaccess.com/full/170249.jpg',
  'https://wallpapercave.com/wp/wp2005597.jpg',
  'https://wallpaperaccess.com/full/16082.jpg',
  'https://wallpaperaccess.com/full/170249.jpg',
  'https://wallpapercave.com/wp/wp2005597.jpg'];

  List<String> imagesArticles = ['https://cdn.wallpapersafari.com/63/25/ME53bd.jpg',
  'https://i.pinimg.com/originals/fd/79/fd/fd79fd5d1d23c08762112a4bb8618cee.jpg',
  'https://wallpaperaccess.com/full/1687326.jpg',
  'https://c4.wallpaperflare.com/wallpaper/716/258/567/golden-sky-landscape-wallpapers-path-rocky-mountains-forest-banff-national-park-alberta-canadian-1920%C3%971200-wallpaper-preview.jpg',
  'https://wallpaperbat.com/img/448570-pink-mountains-wallpaper-top-free-pink-mountains-background.jpg'];

  List<Color> colors = [Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75)];

  List<String> desc = ["How to have a\npeaceful mind",
    "Worlds of the\nwaterfall",
    "How to have a\npeaceful mind",
    "Worlds of the\nwaterfall","Worlds of the\nwaterfall","Worlds of the\nwaterfall"];


  int selectedIndex = 0;

  onSelected(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
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
      bottomNavigationBar: NavigationBar(index: 2,),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 5,
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 2,
                horizontal: SizeConfig.screenWidth * 0.02
              ),
              child: ListView.builder(
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      onTap: (){
                        onSelected(index);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConfig.blockSizeVertical * 4,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 4,
                          vertical: SizeConfig.blockSizeVertical
                        ),
                        decoration: BoxDecoration(
                        color: selectedIndex != null && selectedIndex == index ? Colors.blue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 3,
                        left: SizeConfig.blockSizeHorizontal),
                        child: Text(categories[index],
                        style: GoogleFonts.openSans(
                          color: selectedIndex != null && selectedIndex == index ? Colors.white : Color(fontColorSteelGrey)
                        ),),
                      ),
                    );
                  },
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
                primary: false,
              scrollDirection: Axis.horizontal,
                itemCount: categories.length,
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 1.5,
                horizontal: SizeConfig.screenWidth * 0.05
              ),
              child: Text("POPULAR AUDIOS",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w600,
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02,
                  vertical: SizeConfig.blockSizeVertical
            ),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.2,
            child: ListView.builder(itemBuilder: (BuildContext context, int index){
              return Container(
                width: SizeConfig.screenWidth * 0.45,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02
                ),
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
            primary: false,
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            ),),
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1.5,
                  horizontal: SizeConfig.screenWidth * 0.05
              ),
              child: Text("POPULAR VIDEOS",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w600,
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02,
                  vertical: SizeConfig.blockSizeVertical
              ),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.2,
              child: ListView.builder(itemBuilder: (BuildContext context, int index){
                return Container(
                  width: SizeConfig.screenWidth * 0.45,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: Image.network(imagesVideos[index]).image,
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
                primary: false,
                itemCount: imagesVideos.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
              ),),
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1.5,
                  horizontal: SizeConfig.screenWidth * 0.05
              ),
              child: Text("POPULAR ARTICLES",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w600,
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02,
                  vertical: SizeConfig.blockSizeVertical
              ),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.2,
              child: ListView.builder(itemBuilder: (BuildContext context, int index){
                return Container(
                  width: SizeConfig.screenWidth * 0.45,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: Image.network(imagesArticles[index]).image,
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
                primary: false,
                itemCount: imagesArticles.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
              ),),

          ],
        ),
      ),
    ));
  }
}
