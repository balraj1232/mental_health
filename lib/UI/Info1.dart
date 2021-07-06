import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health/Utils/ActionSheet.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

int selectSocialProfile = -1;
bool selected = false;
File certificateImage;
File adhaarCardImage;

class Info1 extends StatefulWidget {
  const Info1({Key key}) : super(key: key);

  @override
  _Info1State createState() => _Info1State();
}

class _Info1State extends State<Info1> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text("5/7",style: GoogleFonts.openSans(
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
                value: 0.6,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.15,
              ),

              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                ),
                child: Text("Upload your relevant Qualification Certificate",style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)
                ),),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                ),
                child: MaterialButton( onPressed: () {
                  FocusScope.of(context).unfocus();
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => ActionSheet()
                          .actionSheet(context, onCamera: () {
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
                        androidchooseImageFile().then((value)
                        {
                          setState(() {
                            //  loading = true;
                          });
                        }).catchError((onError) {});
                      },text: "Select profile image"));
                },
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: certificateImage != null &&  certificateImage.path != null
                          ? Text(certificateImage.path.split("/").last,style: GoogleFonts.openSans(
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),):Text("UPLOAD CERTIFICATE",style: GoogleFonts.openSans(
                          fontSize: SizeConfig.blockSizeVertical * 2
                      ),),

                  ),
                  minWidth: SizeConfig.screenWidth,
                  textColor: Colors.blue,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.blue
                  )
                ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                  top: SizeConfig.blockSizeVertical * 5,
                ),
                child: Text("Share with us your",style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)
                ),),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                margin:EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: RadioListTile(
                  dense: true,
                  value: 1, groupValue: selectSocialProfile, onChanged: (value){
                  setState(() {
                    selectSocialProfile = value;
                    selected = true;
                  });
                },
                  title: Text("RESUME",style: GoogleFonts.openSans(
                      color: Color(fontColorGray)
                  ),),),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                margin:EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: RadioListTile(
                  dense: true,
                  value: 2, groupValue: selectSocialProfile, onChanged: (value){
                  setState(() {
                    selectSocialProfile = value;
                    selected = true;
                  });
                },
                  title: Text("LINKEDIN",style: GoogleFonts.openSans(
                    color: Color(fontColorGray)
                  ),),),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                margin:EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Link",
                    hintStyle: GoogleFonts.openSans(
                      color: Color(fontColorGray)
                    ),
                    contentPadding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.link)
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                  top: SizeConfig.blockSizeVertical * 5,
                ),
                child: Text("Upload your Adhaar Card",style: GoogleFonts.openSans(
                    fontSize: SizeConfig.blockSizeVertical * 4,
                    fontWeight: FontWeight.bold,
                    color: Color(fontColorSteelGrey)
                ),),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.05,
                  right: SizeConfig.screenWidth * 0.05,
                ),
                child: MaterialButton(onPressed: () {
                  FocusScope.of(context).unfocus();
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => ActionSheet()
                          .actionSheet(context, onCamera: () {
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
                        androidchooseImageFile().then((value)
                        {
                          setState(() {
                            //  loading = true;
                          });
                        }).catchError((onError) {});
                      },text: "Select profile image"));
                },
                  child: adhaarCardImage != null &&  adhaarCardImage.path != null
                      ? Text(adhaarCardImage.path.split("/").last,style: GoogleFonts.openSans(
                      fontSize: SizeConfig.blockSizeVertical * 2
                  ),):Text("UPLOAD CERTIFICATE",style: GoogleFonts.openSans(
                      fontSize: SizeConfig.blockSizeVertical * 2
                  ),),
                  minWidth: SizeConfig.screenWidth,
                  textColor: Colors.blue,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: Colors.blue
                      )
                  ),
                ),
              ),
            ],
          ),
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        backgroundColor: selected == true? Colors.blue : Colors.grey,
        onPressed: (){
          Navigator.of(context).pushNamed('/Info2');
        },
      ),
    ));
  }

  Future<File> chooseCameraFile() async {

    await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        certificateImage = new File(value.path);
      });
      if(certificateImage.path != null){
      }
    }).catchError((error) {
      print(error.toString());
    });
    return certificateImage;
  }




  Future<File> androidchooseImageFile() async {
    await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,

    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        certificateImage = new File(value.path);
      });
      if(certificateImage.path != null){

      }
    }).catchError((error) {
      print(error.toString());
    });
    return certificateImage;
  }


  Future<File> adhaarCameraFile() async {

    await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        adhaarCardImage = new File(value.path);
      });
      if(adhaarCardImage.path != null){
      }
    }).catchError((error) {
      print(error.toString());
    });
    return adhaarCardImage;
  }




  Future<File> adhaarchooseImageFile() async {
    await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,

    ).then((value) async {
      setState(() {
        FocusScope.of(context).unfocus();
        adhaarCardImage = new File(value.path);
      });
      if(adhaarCardImage.path != null){

      }
    }).catchError((error) {
      print(error.toString());
    });
    return adhaarCardImage;
  }

}
