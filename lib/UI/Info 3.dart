import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health/UI/Cafe1.dart';
import 'package:mental_health/UI/Info2.dart';
import 'package:mental_health/UI/LoginScreen.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/Utils/ActionSheet.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/Dialogs.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/constant/AppColor.dart';
import 'package:mental_health/constant/StringConstant.dart';
import 'package:mental_health/data/repo/LoginUser.dart';


File _image;
class Info3 extends StatefulWidget {
  const Info3({Key key}) : super(key: key);

  @override
  _Info3State createState() => _Info3State();
}

class _Info3State extends State<Info3> {

  var createUser = CreateCounsellorRepo();
  final GlobalKey<State> loginLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("7/7",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
            child: Text("Skip",style: GoogleFonts.openSans(
                color: Colors.blue
            ),),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              value: 1,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text("Upload your picture",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 4,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 3),
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: SizeConfig.blockSizeVertical * 7.5,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: SizeConfig.blockSizeVertical * 7.45,
                        child: Container(
                          height: 90,width: 90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:  _image != null
                                      ? FileImage(
                                      File(_image.path))
                                      : AssetImage(
                                      "assets/icons/user.png"),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,

                              ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 55,  top: SizeConfig.blockSizeVertical * 10),
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                ActionSheet().actionSheet(context,
                                    onCamera: () {
                                      FocusScope.of(context).unfocus();
                                      chooseCameraFile().then((File file) {
                                        if (file != null) {
                                          setState(() {
                                            //   loading = true;
                                          });
                                        }
                                      }).catchError((onError) {});
                                    }, onGallery: () {
                                      FocusScope.of(context).unfocus();
                                      androidchooseImageFile().then((value) {
                                        setState(() {
                                          //  loading = true;
                                        });
                                      }).catchError((onError) {});
                                    },text: "Select profile image"));
                      },
                      child: Container(
                          width: SizeConfig.blockSizeVertical * 4.5,
                          height: SizeConfig.blockSizeVertical * 4.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child:  Container(child: Icon(Icons.add_circle,color:Colors.blue,
                            size: SizeConfig.blockSizeVertical * 5,),
                            alignment: Alignment.centerRight,),),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.4,
            ),
            Container(

              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              alignment: Alignment.center,
              child: MaterialButton(onPressed: (){
                Dialogs.showLoadingDialog(
                    context, loginLoader);
              Future.delayed(Duration(seconds: 2)).then((value) {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (conext) {
                          return Cafe1(
                          );
                        }));
              });
               /* createUser
                    .createCounsellor(
                 aadhar: "", about: aboutController.text, certificate: "", context:context , device_id: "",education: "",email: "",experience: "",first_name: firstNameController.text,gender: radioValue,language_ids: "",last_name: lastNameController.text, linkedin:"" ,phone: mobileController.text,photo: "",price: "",price_3:"" ,price_5: "",resume: "",topic_ids:""

                )
                    .then((value) {
                  if (value != null) {
                    if (value.meta.status == "200") {
                      Navigator.of(loginLoader.currentContext,
                          rootNavigator: true)
                          .pop();
                      //toast(value.meta.message);
                      *//*  SharedPreferencesTest().checkIsLogin("0");
                                          SharedPreferencesTest()
                                              .saveToken("set", value: value.token);*//*

                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (conext) {
                                return Cafe1(
                                );
                              }));
                    } else {
                      Navigator.of(loginLoader.currentContext,
                          rootNavigator: true)
                          .pop();
                      showAlertDialog(
                        context,
                        value.meta.message,
                        "",
                      );
                    }
                  } else {
                    Navigator.of(loginLoader.currentContext,
                        rootNavigator: true)
                        .pop();
                    showAlertDialog(
                      context,
                      value.meta.message,
                      "",
                    );
                  }
                }).catchError((error) {
                  Navigator.of(loginLoader.currentContext,
                      rootNavigator: true)
                      .pop();
                  showAlertDialog(
                    context,
                    error.toString(),
                    "",
                  );
                });*/
              //  Navigator.of(context).pushNamed('/Price4');
              },
              color: Colors.blue,
              minWidth: SizeConfig.screenWidth,
              child: Text("Done",style: TextStyle(
                color: Colors.white,
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),),
            )
          ],
        ),
      ),
    ));
  }


  Future<File> chooseCameraFile() async {

    await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        _image = new File(value.path);
      });
      if(_image.path != null){
      }
    }).catchError((error) {
      print(error.toString());
    });
    return _image;
  }




  Future<File> androidchooseImageFile() async {
    await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,

    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        _image = new File(value.path);
      });
      if(_image.path != null){

      }
    }).catchError((error) {
      print(error.toString());
    });
    return _image;
  }
}
