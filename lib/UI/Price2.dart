import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Price2 extends StatefulWidget {
  const Price2({Key key}) : super(key: key);

  @override
  _Price2State createState() => _Price2State();
}

class _Price2State extends State<Price2> {

  GlobalKey<FormState> nameForm = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  FocusNode firstNameFocusNode;
  FocusNode lastNameFocusNode;

  bool selected = false;
  bool filledFn = false;
  bool filledLn = false;


  int radioValue = -1;

  @override void initState() {
    // TODO: implement initState
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("1/7",style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Color(fontColorSteelGrey),
        ),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
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
              value: 0.1,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text("What's Your Name?",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 4,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 4
              ),
              child: Form(
                key: nameForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      focusNode: firstNameFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(fontColorGray)
                          )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        hintText: "First Name",
                        isDense: true,
                        contentPadding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
                      ),
                      onFieldSubmitted: (term){
                        firstNameFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(lastNameFocusNode);
                        filledFn = true;
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      focusNode: lastNameFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color(fontColorGray)
                            )
                        ),
                        hintText: "Last Name",
                        isDense: true,
                        contentPadding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
                      ),
                      onFieldSubmitted: (term){
                        lastNameFocusNode.unfocus();
                        filledLn = true;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 1.5
              ),
              child: Text("How do you identify?",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 4,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            Container(
              child: RadioListTile(
                value: 1, groupValue: radioValue, onChanged: (value){
                setState(() {
                  radioValue = value;
                  selected = true;
                });
              },
                title: Text("Male",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
            Container(
              child: RadioListTile(
                value: 2, groupValue: radioValue, onChanged: (value){
                setState(() {
                  radioValue = value;
                  selected = true;
                });
              },
                title: Text("Female",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
            Container(
              child: RadioListTile(
                value: 3, groupValue: radioValue, onChanged: (value){
                setState(() {
                  radioValue = value;
                  selected = true;
                });
              },
                title: Text("Other",style: TextStyle(
                    color: Color(fontColorGray)
                ),),),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.1,
                  right: SizeConfig.screenWidth * 0.05,
                  bottom: SizeConfig.blockSizeVertical * 10
              ),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                backgroundColor: selected == true && filledLn == true && filledFn == true? Colors.blue : Colors.grey,
                onPressed: (){
                  Navigator.of(context).pushNamed('/Price3');
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
