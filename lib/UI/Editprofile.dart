import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Editprofile extends StatefulWidget{
  String firstname;
  String lastname;
  var price;
  var gender;
  String image;
  Editprofile({this.firstname,this.lastname,this.price,this.image,this.gender});
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  GlobalKey<FormState> nameForm = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  FocusNode firstNameFocusNode;
  FocusNode lastNameFocusNode;


  bool selected = false;
  bool filledFn = false;
  bool filledLn = false;
  String radioValue = "";

  @override void initState() {
    // TODO: implement initState
    print(widget.gender);
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    firstNameController = TextEditingController(text: widget.firstname);
    lastNameController=TextEditingController(text: widget.lastname);
    if(widget.gender=="Male"){
      radioValue=="Male";
    }else{
      radioValue=="Female";
    }
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
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       centerTitle: true,
       title: Text(
         "Edit Profile",
         style: TextStyle(
           color: Color(midnightBlue),
           fontWeight: FontWeight.w600,
         ),
       ),
       elevation: 0.0,
       leading: InkWell(
         onTap: () {
           Navigator.pop(context);
         },
         child: Icon(
           Icons.arrow_back_ios_rounded,
           color: Color(midnightBlue),
         ),
       ),
     ),
     body: Column(children: [
       Container(
         margin: EdgeInsets.only(
           top: SizeConfig.blockSizeVertical * 2,
           right: SizeConfig.screenWidth * 0.05,
           left: SizeConfig.screenWidth * 0.05,
         ),
         alignment: Alignment.center,
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
                 onChanged: (v){
                   setState(() {
                     filledFn = true;
                   });
                 },
                 validator: (c){
                   if(c.isEmpty)
                     return "Please fill required fields";
                 },
               ),
               SizedBox(
                 height: SizeConfig.blockSizeVertical * 2,
               ),
               TextFormField(
                 onChanged: (v){
                   setState(() {
                     filledLn = true;
                   });
                 },
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
                 validator: (c){
                   if(c.isEmpty)
                     return "Please fill required fields";
                 },
               ),
               SizedBox(height: 20,),
               Text(
                 "Gender",
                 style: GoogleFonts.openSans(
                   color: Color(fontColorGray),
                   fontWeight: FontWeight.w600,
                 ),
               ),
               Container(
                 child: RadioListTile<String>(
                   value: "Male", groupValue: radioValue.toString(), onChanged: (String value){
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
                 child: RadioListTile<String>(
                   value: "Female", groupValue: radioValue.toString(), onChanged: (String value){
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
                 child: RadioListTile<String>(
                   value: "Other", groupValue: radioValue.toString(), onChanged: (String value){
                   setState(() {
                     radioValue = value;
                     selected = true;
                   });
                 },
                   title: Text("Other",style: TextStyle(
                       color: Color(fontColorGray)
                   ),),),
               ),



             ],
           ),
         ),
       ),

     ],),
   );
  }
}