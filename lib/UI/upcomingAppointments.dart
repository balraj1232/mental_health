import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/CommonWidgets.dart';
import 'package:mental_health/Utils/DrawerMenu.dart';
import 'package:mental_health/Utils/ListTileCafe1.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/data/repo/UpcomingAppointmentRepo.dart';
import 'package:mental_health/models/AppointmentModal.dart';


class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key key}) : super(key: key);

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  Future<void> _launched;
  var upcomintAppointments = UpcomingAppointmentRepo();
  bool isloading = false;
  List<Appointments> appointments = new List();

  @override
  void initState() {
    super.initState();
    isloading = true;
    upcomintAppointments
        .upcomingAppointmentRepo(
    context,
    )
        .then((value) {
      if (value != null) {
        if (value.meta.status == "200") {
          setState(() {
            isloading = false;
          });
          appointments.addAll(value.appointments);
          //toast(value.meta.message);
          /*  SharedPreferencesTest().checkIsLogin("0");
                                          SharedPreferencesTest()
                                              .saveToken("set", value: value.token);*/

        /*  Navigator.push(context,
              MaterialPageRoute(
                  builder: (conext) {
                    return OTPScreen(
                      phoneNumber: mobileController.text,
                    );
                  }));*/
        } else {
          showAlertDialog(
            context,
            value.meta.message,
            "",
          );
        }
      } else {
        showAlertDialog(
          context,
          "No data found",
          "",
        );
      }
    }).catchError((error) {
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
    List<Widget> widgetList = new List<Widget>();
    var child = SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       /*     Container(
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
            ),*/
            Text("TODAY",style: GoogleFonts.openSans(
              color: Color(fontColorGray),
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
           Container(
             height:SizeConfig.blockSizeVertical * 80 ,
             child: appointments != null && appointments.length > 0  ?  ListView.builder(itemBuilder: (context, index){
               return appointments != null && appointments.length > 0 ?  listTileCafe1(context,"Kriti Singh","17:00",(){
                 setState(() {
                   _launched = makePhoneCall();
                 });
               }): Container(
                 child: Center(child: Text("No Upcoming Appointments", style:  TextStyle(color: Colors.black),)),
               );
             }, itemCount: appointments.length,): Container(
               child: Center(child: Text("No Upcoming Appointments", style:  TextStyle(color: Colors.black),)),
             ),
           )
          ],
        ),
      ),
      drawer: DrawerMenu(),

    ),
    );
    widgetList.add(child);
    if (isloading) {
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
}
