import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/Editprofile.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SharedPref.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/data/repo/getTherapistDetailRepo.dart';
import 'package:mental_health/models/getTherapistDetailModal.dart';
import 'HomeMain.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    getprofile();
    isloding = true;
    // TODO: implement initState
    super.initState();
  }
  bool isloding = false;
  var getHomeContent = GetTherapistDetailRepo();
  var getHomeContentModal = GetTherapistDetailModal();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> widgetList = new List<Widget>();
    var child=SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/bg/my profile bg.png'),
                            fit: BoxFit.cover),
                      ),
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.4,
                    ),
                    Container(
                      child: Stack(
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppBar(
                                leading: InkWell(
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                elevation: 0.0,
                                centerTitle: true,
                                backgroundColor: Colors.transparent,
                                title: Text(
                                  "My Profile",
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                  ),
                                ),
                                actions: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofile(
                                        firstname:  getHomeContentModal.therapist.firstName,
                                          lastname: getHomeContentModal.therapist.lastName,
                                          image: getHomeContentModal.therapist.photo,
                                        gender:getHomeContentModal.therapist.gender,
                                        price:getHomeContentModal.therapist.price
                                      )));
                                    },
                                    child: Padding(
                                      padding:EdgeInsets.only(
                                        right: SizeConfig.screenWidth * 0.05,),
                                      child: Icon(Icons.edit_outlined,color: Colors.white,),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: SizeConfig.screenWidth,
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.screenHeight * 0.15),
                                  width: SizeConfig.screenWidth * 0.25,
                                  height: SizeConfig.screenHeight * 0.12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ClipRRect(
                                    child: getHomeContentModal.therapist != null &&
                                        getHomeContentModal.therapist.photo != null &&
                                        getHomeContentModal.therapist.photo != ""
                                        ? CachedNetworkImage(
                                        imageUrl: getHomeContentModal.therapist.photo)
                                        : Image.asset('assets/bg/profile.png'),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                width: SizeConfig.screenWidth,
                                alignment: Alignment.center,
                                child: Text(
                                  getHomeContentModal.therapist.firstName != "" && getHomeContentModal.therapist.firstName != null
                                      ? getHomeContentModal.therapist.firstName +
                                      " " +
                                      getHomeContentModal.therapist.lastName
                                      : "",
                                  style: GoogleFonts.openSans(
                                      color: Color(backgroundColorBlue),
                                      fontSize: SizeConfig.blockSizeVertical * 2.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: SizeConfig.screenWidth,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Counsellor",
                                      style: GoogleFonts.openSans(
                                        color: Color(fontColorSteelGrey),
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal,
                                    ),
                                    Image.asset(
                                      'assets/bg/circle.png',
                                      height: SizeConfig.blockSizeVertical * 0.5,
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal,
                                    ),
                                    Text(
                                      getTherapistData != null &&
                                          getTherapistData.totalRating != null
                                          ? getTherapistData.totalRating
                                          : "",
                                      style: GoogleFonts.openSans(
                                        color: Color(fontColorSteelGrey),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/icons/star.png',
                                      height: SizeConfig.blockSizeVertical * 2,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 4),
                                width: SizeConfig.screenWidth,
                                height: SizeConfig.blockSizeVertical * 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "500",
                                          style: GoogleFonts.openSans(
                                              color: Color(backgroundColorBlue),
                                              fontSize:
                                              SizeConfig.blockSizeVertical * 4,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "PRICE PER \nSESSION",
                                          style: GoogleFonts.openSans(
                                            color: Color(fontColorGray),
                                            fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeHorizontal * 0.2,
                                      height: SizeConfig.blockSizeVertical * 9,
                                      color: Color(0XFFD8DFE9),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "0",
                                          style: GoogleFonts.openSans(
                                              color: Color(backgroundColorBlue),
                                              fontSize:
                                              SizeConfig.blockSizeVertical * 4,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "FOLLOW UP \nSESSION",
                                          style: GoogleFonts.openSans(
                                            color: Color(fontColorGray),
                                            fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 4,
                                    left: SizeConfig.screenWidth * 0.05,
                                    right: SizeConfig.screenWidth * 0.05),
                                child: Text(
                                  "ABOUT",
                                  style: GoogleFonts.openSans(
                                      color: Color(fontColorGray),
                                      fontWeight: FontWeight.w600,
                                      fontSize: SizeConfig.blockSizeVertical * 2),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical,
                                    left: SizeConfig.screenWidth * 0.05,
                                    right: SizeConfig.screenWidth * 0.05),
                                child: Text(
                                  getTherapistData != null && getTherapistData != ""
                                      ? getTherapistData.about
                                      : "",
                                  style: GoogleFonts.openSans(
                                      color: Color(fontColorGray),
                                      fontSize: SizeConfig.blockSizeVertical *
                                          1.75),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2.5,
                                    left: SizeConfig.screenWidth * 0.05,
                                    right: SizeConfig.screenWidth * 0.05),
                                child: Text(
                                  "AREA OF EXPERTISE",
                                  style: GoogleFonts.openSans(
                                      color: Color(fontColorGray),
                                      fontWeight: FontWeight.w600,
                                      fontSize: SizeConfig.blockSizeVertical * 2),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.screenWidth * 0.05,
                                    right: SizeConfig.screenWidth * 0.05,
                                    top: SizeConfig.blockSizeVertical),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  runSpacing: 5,
                                  spacing: 2,
                                  children: [
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 6,
                                      width: SizeConfig.screenWidth * 0.4,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Anxiety Management",
                                        style: GoogleFonts.openSans(
                                            color: Color(backgroundColorBlue),
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                            SizeConfig.blockSizeVertical * 1.75),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFE4F0F8),
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 6,
                                      width: SizeConfig.screenWidth * 0.4,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Life Coaching",
                                        style: GoogleFonts.openSans(
                                            color: Color(backgroundColorBlue),
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                            SizeConfig.blockSizeVertical * 1.75),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFE4F0F8),
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 6,
                                      width: SizeConfig.screenWidth * 0.4,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Overcoming Grief",
                                        style: GoogleFonts.openSans(
                                            color: Color(backgroundColorBlue),
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                            SizeConfig.blockSizeVertical * 1.75),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFE4F0F8),
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 2.5,
                                    left: SizeConfig.screenWidth * 0.05,
                                    right: SizeConfig.screenWidth * 0.05),
                                child: Text(
                                  "LANGUAGES",
                                  style: GoogleFonts.openSans(
                                      color: Color(fontColorGray),
                                      fontWeight: FontWeight.w600,
                                      fontSize: SizeConfig.blockSizeVertical * 2),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.screenWidth * 0.05,
                                    right: SizeConfig.screenWidth * 0.05,
                                    top: SizeConfig.blockSizeVertical),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  runSpacing: 5,
                                  spacing: 2,
                                  children: [
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 6,
                                      width: SizeConfig.screenWidth * 0.3,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "English",
                                        style: GoogleFonts.openSans(
                                            color: Color(backgroundColorBlue),
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                            SizeConfig.blockSizeVertical * 1.75),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFE4F0F8),
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )) ;
    widgetList.add(child);
    if (isloding) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(colorPrimary),
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(children: widgetList);

  }

  void getprofile() {
    setState(() {
      isloding = true;
    });
     getTherapistId();
    //SharedPrfre
  }
  getTherapistId() async {
    SharedPreferencesTest().getTherapistId().then((value) async {
      if (value != null && value != "") {
        setState(() {
          therapistId = value;
          print(therapistId);
        });
        getHomeContent
            .getTherapistDetail(
          context: context,
            therapistId: therapistId
        )
            .then((value) {
          if (value != null) {
            print(value.meta.status);
            if (value.meta.status == "200") {
              setState(() {
                isloding = false;
                getHomeContentModal = value;
                print(getHomeContentModal.therapist.firstName);
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
    });

// });}}
}}