import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool selected = false;
  FocusNode firstDigit;
  FocusNode secondDigit;
  FocusNode thirdDigit;
  FocusNode fourthDigit;
  FocusNode fifthDigit;
  FocusNode sixthDigit;

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  TextEditingController fifthController = TextEditingController();
  TextEditingController sixthController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstDigit = FocusNode();
    secondDigit = FocusNode();
    thirdDigit = FocusNode();
    fourthDigit = FocusNode();
    fifthDigit = FocusNode();
    sixthDigit = FocusNode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    firstDigit.dispose();
    secondDigit.dispose();
    thirdDigit.dispose();
    fourthDigit.dispose();
    fifthDigit.dispose();
    sixthDigit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton:FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
          backgroundColor: selected == true? Colors.blue : Colors.grey,
          onPressed: (){
            Navigator.of(context).pushNamed('/Price1');
          },
        ),
        body: Container(
          margin: EdgeInsets.only(
            left: SizeConfig.screenWidth * 0.05,
            right: SizeConfig.screenWidth * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your \nVerification Code",style:
                GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                  color: Color(fontColorSteelGrey),
                ),),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              Text("Sent to +91 7497975353",style:
              GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.blockSizeVertical * 1.5,
                color: Color(fontColorGray),
              ),),
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: firstController,
                        focusNode: firstDigit,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          firstDigit.unfocus();
                          FocusScope.of(context).requestFocus(secondDigit);
                        },
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: secondController,
                        focusNode: secondDigit,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],                      keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          secondDigit.unfocus();
                          FocusScope.of(context).requestFocus(thirdDigit);
                        },
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: thirdController,
                        focusNode: thirdDigit,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          thirdDigit.unfocus();
                          FocusScope.of(context).requestFocus(fourthDigit);
                        },
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: fourthController,
                        focusNode: fourthDigit,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          fourthDigit.unfocus();
                          FocusScope.of(context).requestFocus(fifthDigit);
                        },),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: fifthController,
                        focusNode: fifthDigit,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          fifthDigit.unfocus();
                          FocusScope.of(context).requestFocus(sixthDigit);
                        },
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        controller: sixthController,
                        focusNode: sixthDigit,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeVertical * 3.75,
                            fontWeight: FontWeight.bold
                        ),
                        onSubmitted: (term){
                          sixthDigit.unfocus();
                          Navigator.of(context).pushNamed('/Price1');
                        },
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1.5,
              ),
              Text("RESEND OTP",style:
              GoogleFonts.openSans(
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.blockSizeVertical * 1.5,
                color: Color(backgroundColorBlue),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
