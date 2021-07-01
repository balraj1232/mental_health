import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class MyContent extends StatefulWidget {
  const MyContent({Key key}) : super(key: key);

  @override
  _MyContentState createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {

  List<String> imagesMyContent = ['assets/bg/gridCard1.png',
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
                        image: Image.asset(imagesMyContent[index]).image,
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
                itemCount: imagesMyContent.length,),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("My Content",
        style: GoogleFonts.openSans(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        leading: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
      ),

    ));
  }
}
