/*
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/UI/LoginScreen.dart';
import 'package:mental_health/Utils/SizeConfig.dart';



showAlertDialog(BuildContext context, String message, String type,
    {double rate,
      bool isfeedback,
      String submitfeedback,
      String logoutUser,
      Function onTap,
      String userToken,
      userId,
      groupId}) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.bottomRight,
                child: SvgPicture.
                asset(
                  "assets/cancelIcon.svg",
                  width: 12,
                  height: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
              alignment: Alignment.center,
              child: Text(
                  message,
                  maxLines: 2,
                  */
/* "Your Session is expired.Please Login again"*//*
,
               style: TextStyle(
                   fontSize: SizeConfig.blockSizeVertical * 2.2,
                   color: Colors.black),),
            ),
            type != "Logout"
                ? Container(
              margin:
              EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  if (type == "Forget Password") {
                    FocusScope.of(context).unfocus();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen());
                        }));
                  } if (type == "GroupUpdate") {
                    FocusScope.of(context).unfocus();



                  }else{
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  decoration:
                  boxDecoration(bgColor: colorPrimary, radius: 30),
                  padding: EdgeInsets.fromLTRB(38, 8, 38, 10),
                  child: Text("Ok",style: TextStyle( color: Colors.wh,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  fontFamily: fontRegular),
                     ),
                ),
              ),
            )
                : Container(
              alignment: Alignment.bottomCenter,
              margin:
              EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        if (type == "Logout") {
                          onTap();
                        } else {
                          if (type == "Forget Password") {
                            finish(context);
                          } else if (type == "Update Profile") {
                            finish(context);
                          } else if (type == "GroupUpdate")
                          {
                            finish(context);
                          } else if (type == "Change Password") {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return UserProfile();
                                    }));
                          } else if (type == "Invite Friend") {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return BottomNavigationScreen();
                                    }));
                          } else if (type == "create post") {
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Container(
                        decoration: boxDecoration(
                            bgColor: colorPrimary, radius: 30),
                        padding: EdgeInsets.fromLTRB(28, 4, 28, 6),
                        child: text("Yes",
                            textColor: white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontRegular),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: boxDecoration(
                            bgColor: colorTextSecondary, radius: 30),
                        padding: EdgeInsets.fromLTRB(28, 4, 28, 6),
                        child: text("No",
                            textColor: white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontRegular),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(onWillPop: () async => false, child: alert);
    },
  );
}

showfeedback(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      elevation: 0.0,
      isScrollControlled: true,
      backgroundColor: appStore.scaffoldBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      builder: (builder) {
        //   return FeedbackScreen();
        */
/*FeedbackScreen();*//*

      })
      .then((value) {});
}

Widget getItem({String name, Icon icon, Function ontap}) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(width: 16),
                icon,
                SizedBox(width: 16),
                text(name, textColor: appStore.textPrimaryColor)
              ],
            ),
          ),
          IconButton(
            onPressed: ontap,
            icon: Icon(Icons.keyboard_arrow_right),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Divider(),
      )
    ],
  );
}

Widget getToggleButton(
    {String name, Icon icon, Function onChanged, bool val, double scale}) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(width: 16),
                icon,
                SizedBox(width: 16),
                text(name, textColor: appStore.textPrimaryColor)
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 5),
              child: Transform.scale(
                scale: scale,
                child: CupertinoSwitch(
                    activeColor: colorPrimary,
                    value: val,
                    onChanged: onChanged),
              ))
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Divider(),
      )
    ],
  );
}

KeyboardActionsConfig buildConfig(BuildContext context, FocusNode node) {
  return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey.shade300,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayArrows: false,
          focusNode: node,
        )
      ]);
}

Future<String> dateBottomSheet(context) async {
  var now = DateTime.now();
  var today = DateTime(now.year - 50, now.month, now.day);
  String date;
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          height: 245,
          child: Column(
            children: [
              Container(
                color: appStore.appBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cancel',
                      style: boldTextStyle(),
                    ).onTap(() {
                      finish(context);
                    }),
                    Text(
                      'Done',
                      style: boldTextStyle(),
                    ).onTap(() {
                      finish(context, date);
                    })
                  ],
                ).paddingOnly(top: 8, left: 8, right: 8, bottom: 8),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: primaryTextStyle(size: 20))),
                  child: CupertinoDatePicker(
                    backgroundColor: appStore.appBarColor,
                    minimumDate: today,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (var dateTime) {
                      var dateFormat = new DateFormat('MM/dd/yyyy');
                      String formattedDate = dateFormat.format(dateTime);
                      print(formattedDate);
                      date = formattedDate;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      });
  return date;
}
*/
