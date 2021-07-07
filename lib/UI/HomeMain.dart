import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/CommonWidgets.dart';
import 'package:mental_health/Utils/DrawerMenu.dart';
import 'package:mental_health/Utils/ListTileAppointment.dart';
import 'package:mental_health/Utils/NavigationBar.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/Utils/TimeAgoWidget.dart';
import 'package:mental_health/data/repo/getHomeContentRepo.dart';
import 'package:mental_health/models/GetHomeContentModal.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  Future<void> _launched;
  bool isloding = false;
  var getHomeContent = GetHomePageContentRepo();
  var getHomeContentModal = GetHomeContentModal();


  List<Color> colors = [
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),
  ];

  @override
  void initState() {
    super.initState();
    isloding = true;
    getHomeContent
        .getHomeContent(
      context: context,
    )
        .then((value) {
      if (value != null) {
        if (value.meta.status == "200") {
          setState(() {
            isloding = false;
            getHomeContentModal = value;
          });
        } else {
          setState(() {
            isloding = false;
          });
          showAlertDialog(
            context,
            value.meta.message,
            "",
          );
        }
      } else {
        setState(() {
          isloding = false;
        });
        showAlertDialog(
          context,
          value.meta.message,
          "",
        );
      }
    }).catchError((error) {
      setState(() {
        isloding = false;
      });
      showAlertDialog(
        context,
        error.toString(),
        "",
      );
    });
  }



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
                        child: Text("Dr. ${firstNameController.text + lastNameController.text}",
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
                              listTileAppointment(context, "Kriti Singh", "17:00", (){
                                setState(() {
                                  _launched = makePhoneCall();
                                });
                              }),
                              listTileAppointment(context, "Kriti Singh", "17:00", (){
                                setState(() {
                                  _launched = makePhoneCall();
                                });
                              }),
                            ],
                          )),
                      Container(
                        margin:EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                        ),
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed('/Cafe1');
                          },
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
                            vertical: SizeConfig.blockSizeVertical * 2),
                        child: getHomeContentModal != null &&
                            getHomeContentModal.articles != null &&
                            getHomeContentModal.articles.length > 0
                            ? GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                          itemBuilder: (BuildContext context, int index) {
                            /* if(colors.length < getHomeContentModal.articles.length){
                                    colors.addAll(colors);
                                  }*/
                            return Container(
                              width: SizeConfig.screenWidth * 0.4,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: getHomeContentModal != null &&
                                      getHomeContentModal
                                          .articles.length >
                                          0 &&
                                      getHomeContentModal.articles
                                          .elementAt(index)
                                          .photo !=
                                          null &&
                                      getHomeContentModal.articles
                                          .elementAt(index)
                                          .photo !=
                                          ""
                                      ? CachedNetworkImageProvider(
                                      "https://sal-prod.s3.ap-south-1.amazonaws.com/" +
                                          getHomeContentModal.articles
                                              .elementAt(index)
                                              .photo)
                                      : AssetImage(
                                    "assets/bg/gridCard1.png",
                                  ),
                                ),
                              ),
                              child: Container(
                                width: SizeConfig.screenWidth,
                                padding: EdgeInsets.only(
                                    left: SizeConfig.screenWidth * 0.02,
                                    right: SizeConfig.screenWidth * 0.02),
                                height: SizeConfig.blockSizeVertical * 8,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: colors[index],
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getHomeContentModal != null &&
                                          getHomeContentModal
                                              .articles.length >
                                              0
                                          ? getHomeContentModal.articles
                                          .elementAt(index)
                                          .title
                                          : "",
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,fontSize: SizeConfig.blockSizeVertical  * 2),
                                    ),
                                    Text(
                                      timeAgo(DateTime.parse(
                                          getHomeContentModal.articles
                                              .elementAt(index)
                                              .createdAt)),
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: SizeConfig
                                              .blockSizeVertical *
                                              1.75),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: getHomeContentModal.articles !=
                              null &&
                              getHomeContentModal.articles.length > 0
                              ? getHomeContentModal.articles.length
                              : 0,
                        )
                            : Container(
                          child: Center(child: Text("No content found")),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: DrawerMenu(),
      bottomNavigationBar: NavigationBar(index: 0,),

    ));
  }




}


