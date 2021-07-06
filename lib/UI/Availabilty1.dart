import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class Availability extends StatefulWidget {
  const Availability({Key key}) : super(key: key);

  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {

  List<String> time = ['12:00 - 17:00 PM','12:00 - 17:00 PM','17:00 - 19:00 PM','17:00 - 19:00 PM'];
  List<bool> switches = [true,true,false,false];
  List<String> day = ['TOMORROW','EVERYDAY','SUN,MON,WED','MONDAY'];
  List<bool> selected = [false,false,false,false];

  bool selectedCheckbox = true;
  bool showDelete = false;

  bool switch1 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Availability",
        style: TextStyle(
          color: Color(midnightBlue)
        ),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child:Icon(Icons.arrow_back_ios_rounded,color:Color(midnightBlue))
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: SizeConfig.blockSizeHorizontal * 5

            ),
            child: showDelete == false ? ImageIcon(AssetImage('assets/icons/delete.png'),
            color: Color(fontColorGray),
            size: SizeConfig.blockSizeVertical * 2,) : Container(
              alignment: Alignment.center,
              child: Text("Delete",
                style: TextStyle(
                    color: Color(backgroundColorBlue),
                  fontWeight: FontWeight.w600
                ),),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(backgroundColorBlue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.blockSizeVertical
              ),
              child: ListView.builder(itemBuilder: (BuildContext context,int index){
                return ListTile(
                  onLongPress: (){
                    setState(() {
                      selected[index] = true;
                      showDelete = true;
                    });
                  },
                    onTap: (){
                    setState(() {
                      selected[index] = false;
                      showDelete = false;
                    });
                    },
                  tileColor: selected[index] == false ? Colors.white : Color(0XFFF8F8F8),
                  title: Text(time[index]),
                  subtitle: Text(day[index]),
                  dense: true,
                  trailing: selected[index] == false ?Switch(
                    value: switches[index],
                    onChanged: (value){
                      setState(() {
                        switches[index] = value;
                      });
                    },
                    activeColor: Color(backgroundColorBlue),
                    inactiveThumbColor: Color(fontColorGray),
                    activeTrackColor: Color(0XFFDBE6F5),
                    inactiveTrackColor: Color(0XFFD8DFE9),
                  ):
                      Checkbox(value: selectedCheckbox, onChanged: (value){
                        selectedCheckbox = value;
                      })
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: time.length,
              primary: false,
              )
            ),
          ],
        ),
      ),
    ));
  }
}
