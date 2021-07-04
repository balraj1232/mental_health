import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health/UI/Info%203.dart';
import 'package:mental_health/UI/Price2.dart';
import 'package:mental_health/UI/Price3.dart';
import 'package:mental_health/Utils/ActionSheet.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';


class Price4 extends StatefulWidget {
  const Price4({Key key}) : super(key: key);

  @override
  _Price4State createState() => _Price4State();
}

class _Price4State extends State<Price4> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Summary",style: GoogleFonts.openSans(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
        centerTitle: true,
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth * 0.05,
          right: SizeConfig.screenWidth * 0.05,
          top: SizeConfig.blockSizeVertical * 3,
        ),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 0.9,
              offset: Offset.fromDirection(2,1),
            )],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: (){},
              color: Colors.white,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text("EDIT",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Color(fontColorGray)
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/Price5');
              },
              color: Colors.blue,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text("SUBMIT",style: GoogleFonts.openSans(
                color: Colors.white,
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Colors.blue
                ),
              ),
            ),
          ],
        ),),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                              image:  image != null
                                  ? FileImage(
                                  File(image.path))
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
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 5,
                right: SizeConfig.screenWidth * 0.05,
                left: SizeConfig.screenWidth * 0.05,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(firstNameController.text + lastNameController.text,style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeVertical * 2.5
                  ),),
                  Text("Counselling Therapist",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.blockSizeVertical * 2
                  ),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 4,
                bottom: SizeConfig.blockSizeVertical * 4
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text(radioValue,style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Languages",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text(selectedVal,style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Areas Of Expertise",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("Anxiety Management, Life Coaching",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Qualification",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("Clinical Psychologist",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Experience",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("10 Years",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text("Qualification Certificate",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  Text("File_name.pdf",style: GoogleFonts.openSans(
                      color: Color(fontColorGray),
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 8,
                  ),
                ],
              ),
            ),
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
        image = new File(value.path);
      });
      if(image.path != null){
      }
    }).catchError((error) {
      print(error.toString());
    });
    return image;
  }




  Future<File> androidchooseImageFile() async {
    await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,

    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        image = new File(value.path);
      });
      if(image.path != null){

      }
    }).catchError((error) {
      print(error.toString());
    });
    return image;
  }
}
