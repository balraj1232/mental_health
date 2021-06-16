import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContent extends StatefulWidget {
  const MyContent({Key key}) : super(key: key);

  @override
  _MyContentState createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("My Content",
        style: GoogleFonts.openSans(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        leading: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
      ),

    ));
  }
}
