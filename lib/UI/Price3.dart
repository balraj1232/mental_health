import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Price3 extends StatefulWidget {
  const Price3({Key key}) : super(key: key);

  @override
  _Price3State createState() => _Price3State();
}

class _Price3State extends State<Price3> {

  bool engCheckBox = false;
  bool hindiCheckBox = false;
  bool tamilCheckBox = false;
  bool gujaratiCheckBox = false;
  bool teluguCheckBox = false;
  bool urduCheckBox = false;
  bool punjabiCheckBox = false;
  bool bengaliCheckBox = false;
  bool marathiCheckBox = false;
  bool kannadaCheckBox = false;
  bool odiaCheckBox = false;
  bool malayalamCheckBox = false;
  bool assamCheckBox = false;
  bool maithiliCheckBox = false;
  bool sanskritCheckBox = false;

  bool selected = false;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("2/7",style: GoogleFonts.openSans(
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
              value: 0.3,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Text("What languages do you speak?",style: GoogleFonts.openSans(
                  fontSize: SizeConfig.blockSizeVertical * 4,
                  fontWeight: FontWeight.bold,
                  color: Color(fontColorSteelGrey)
              ),),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
              children: [
                CheckboxListTile(value: engCheckBox, onChanged: (bool val){
                  setState(() {
                    engCheckBox = val;
                    selected = true;
                  });
                },
                 title: Text("English"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: hindiCheckBox, onChanged: (bool val){
                  setState(() {
                    hindiCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Hindi"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: tamilCheckBox, onChanged: (bool val){
                  setState(() {
                    tamilCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Tamil"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: gujaratiCheckBox, onChanged: (bool val){
                  setState(() {
                    gujaratiCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Gujarati"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: teluguCheckBox, onChanged: (bool val){
                  setState(() {
                    teluguCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Telugu"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: urduCheckBox, onChanged: (bool val){
                  setState(() {
                    urduCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Urdu"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: punjabiCheckBox, onChanged: (bool val){
                  setState(() {
                    punjabiCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Punjabi"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: bengaliCheckBox, onChanged: (bool val){
                  setState(() {
                    bengaliCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Bengali"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: marathiCheckBox, onChanged: (bool val){
                  setState(() {
                    marathiCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Marathi"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: kannadaCheckBox, onChanged: (bool val){
                  setState(() {
                    kannadaCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Kannada"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: odiaCheckBox, onChanged: (bool val){
                  setState(() {
                    odiaCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Odia"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: malayalamCheckBox, onChanged: (bool val){
                  setState(() {
                    malayalamCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Malayalam"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: assamCheckBox, onChanged: (bool val){
                  setState(() {
                    assamCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Assamese"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: maithiliCheckBox, onChanged: (bool val){
                  setState(() {
                    maithiliCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Maithili"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(value: sanskritCheckBox, onChanged: (bool val){
                  setState(() {
                    sanskritCheckBox = val;
                    selected = true;
                  });
                },
                  title: Text("Sanskrit"),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        backgroundColor: selected == true? Colors.blue : Colors.grey,
        onPressed: (){
          Navigator.of(context).pushNamed('/ProfessionalInfo1');
        },
      ),
    ));
  }
}
