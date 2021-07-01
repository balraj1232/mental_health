import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Assessments extends StatefulWidget {
  const Assessments({Key key}) : super(key: key);

  @override
  _AssessmentsState createState() => _AssessmentsState();
}

class _AssessmentsState extends State<Assessments> {

  List<String> cardTitle = ['Self resilience survey','Perceived stress scale- Stress in general',
  'Self resilience survey','Self resilience survey'];

  List<Color> colors = [Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(48, 37, 33, 0.75),
    Color.fromRGBO(42, 138, 163, 0.75),
    Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75),Color.fromRGBO(0, 90, 100, 0.75)];

  List<String> time = ['3-5','10-15','3-5','10-15'];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Assessments",
        style: TextStyle(
          color: Color(midnightBlue),
          fontWeight: FontWeight.w600,
        ),),
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded,color: Color(midnightBlue),),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.blockSizeVertical * 2
              ),
              child: ListView.builder(itemBuilder: (BuildContext context, int index){
                return ListTile();
              }),
            ),
          ],
        ),
      ),
    ));
  }
}
