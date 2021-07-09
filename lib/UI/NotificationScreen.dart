import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/data/repo/notificationRepo.dart';
import 'package:mental_health/models/notificationModal.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var notification  = NotificationRepo();
  List<Notifications> getPaymentsModal = new List();
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    isloading = true;
    notification
        .notificationRepo(
      context: context,
    )
        .then((value) {
      if (value != null) {
        if (value.meta.status == "200") {
          setState(() {
            isloading = false;
            getPaymentsModal.addAll(value.notifications);
          });
        } else {
          setState(() {
            isloading = false;
          });
          showAlertDialog(
            context,
            value.meta.message,
            "",
          );
        }
      } else {
        setState(() {
          isloading = false;

        });
        showAlertDialog(
          context,
          value.meta.message,
          "",
        );
      }
    }).catchError((error) {
      setState(() {
        isloading = false;
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
    List<Widget> widgetList = new List<Widget>();
    var child = SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded,color: Color(midnightBlue),),
        ),
        centerTitle: true,
        title: Text("Payments",
          style: TextStyle(
              color: Color(midnightBlue),
              fontWeight: FontWeight.w600
          ),),
        actions: [
          Container(
            margin: EdgeInsets.only(
                right: SizeConfig.screenWidth * 0.05
            ),
            alignment: Alignment.center,
            child: ImageIcon(AssetImage('assets/icons/paymentIconAppBar.png'),
              color: Color(midnightBlue),
              size: SizeConfig.blockSizeVertical * 2.5,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical,
                horizontal: SizeConfig.screenWidth * 0.02,
              ),
              child: ListView.builder(itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeVertical * 1.5, top: SizeConfig.blockSizeVertical*2
                  ),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat("yMMMMd").format(DateTime.parse(getPaymentsModal.elementAt(index).createdAt)),style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 1.25
                        ),),
                        Text( "Anamika Singh",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(fontColorSteelGrey),
                            fontSize: SizeConfig.blockSizeVertical * 2
                        ),),
                        Text(getPaymentsModal.elementAt(index).body,style: TextStyle(
                            color: Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 1.25
                        ),),
                      ],
                    ),
                  ),
                );
              },
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:getPaymentsModal != null && getPaymentsModal.length > 0 ?  getPaymentsModal.length: 0,
                primary: false,),
            ),
          ],
        ),
      ),
    ));

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
