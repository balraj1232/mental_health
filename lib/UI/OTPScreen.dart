import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/UI/Price1.dart';
import 'package:mental_health/Utils/AlertDialog.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/Dialogs.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/data/repo/verifyOtpRepo.dart';
import 'package:nb_utils/nb_utils.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({Key key, this.phoneNumber}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<State> loginLoader = new GlobalKey<State>();


bool selected = false;
  FocusNode firstDigit;
  FocusNode secondDigit;
  FocusNode thirdDigit;
  FocusNode fourthDigit;
  FocusNode fifthDigit;
  FocusNode sixthDigit;
  var verifyOtp = VerifyOtpRepo();

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstDigit = FocusNode();
    secondDigit = FocusNode();
    thirdDigit = FocusNode();
    fourthDigit = FocusNode();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    firstDigit.dispose();
    secondDigit.dispose();
    thirdDigit.dispose();
    fourthDigit.dispose();

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
            onPressed: () {
              if (firstController.text.isNotEmpty &&
                  secondController.text.isNotEmpty &&
                  thirdController.text.isNotEmpty &&
                  fourthController.text.isNotEmpty) {
                Navigator.push(context, MaterialPageRoute(builder: (conext){
                  return Price1(getOtp:  firstController.text +
                      secondController.text +
                      thirdController.text +
                      fourthController.text );
                }));
                Dialogs.showLoadingDialog(context, loginLoader);
                verifyOtp
                    .verifyOtp(
                  context: context,
                  phone: widget.phoneNumber,
                  otp: firstController.text +
                      secondController.text+
                      thirdController.text+
                      fourthController.text
                ).then((value) {
                  if (value != null) {
                    if (value.meta.status == "200") {
                      Navigator.of(loginLoader.currentContext,
                          rootNavigator: true)
                          .pop();
                      toast(value.meta.message);
                      Navigator.push(context, MaterialPageRoute(builder: (conext){
                        return Price1(getOtp:  firstController.text +
                            secondController.text +
                            thirdController.text +
                            fourthController.text,);
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
                });
              }else{
                toast("Otp is required");
              }
            }
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
              Text("Sent to ${widget.phoneNumber}",style:
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
                        onChanged: (v){
                          setState(() {
                            selected = true;
                          });
                        },
                        onSubmitted: (term){
                          fourthDigit.unfocus();
                          FocusScope.of(context).requestFocus(fifthDigit);
                        },),
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
