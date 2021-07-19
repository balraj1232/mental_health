import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:intl/intl.dart';

class AddNewEvent extends StatefulWidget {
  const AddNewEvent({Key key}) : super(key: key);

  @override
  _AddNewEventState createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewEvent> {

  GlobalKey<FormState> newEventFormKey = GlobalKey<FormState>();
  String topic;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTimeFrom = TimeOfDay(hour: 00, minute: 00);
  String _setTime;
  String _hourFrom, _minuteFrom, _timeFrom;
  String dateTimeFrom;
  int _value = 1;

  TextEditingController eventName = TextEditingController();
  TextEditingController eventDesc = TextEditingController();
  TextEditingController eventTopic = TextEditingController();
  TextEditingController eventDate = TextEditingController();
  TextEditingController eventTime = TextEditingController();

  FocusNode eventNameFn;
  FocusNode eventDescFn;
  FocusNode eventTopicFn;
  FocusNode eventDateFn;
  FocusNode eventTimeFn;

  @override
  void initState() {
    // TODO: implement initState
    eventNameFn = FocusNode();
    eventDescFn = FocusNode();
    eventTopicFn = FocusNode();
    eventDateFn = FocusNode();
    eventTimeFn = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eventNameFn.dispose();
    eventDescFn.dispose();
    eventTopicFn.dispose();
    eventDateFn.dispose();
    eventTimeFn.dispose();
  }

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });

    eventDate.text = DateFormat.yMd().format(selectedDate);
  }

  Future<Null> _selectFromTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeFrom,
    );
    if (picked != null)
      setState(() {
        selectedTimeFrom = picked;
        _hourFrom = selectedTimeFrom.hour.toString();
        _minuteFrom = selectedTimeFrom.minute.toString();
        _timeFrom = _hourFrom + ' : ' + _minuteFrom;
        eventTime.text = _timeFrom;
        eventTime.text = formatDate(
            DateTime(
                2019, 08, 1, selectedTimeFrom.hour, selectedTimeFrom.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "New Event",
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: newEventFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: Text(
                      "Event Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: TextFormField(
                      focusNode: eventNameFn,
                      controller: eventName,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        hintText: "Enter Event Name",
                        hintStyle: TextStyle(
                            color: Color(fontColorGray),
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeVertical * 1.75),
                      ),
                      onFieldSubmitted: (value){
                        eventNameFn.unfocus();
                        FocusScope.of(context).requestFocus(eventDescFn);
                      },
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: Text(
                      "Event Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: TextFormField(
                      focusNode: eventDescFn,
                      controller: eventDesc,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        hintText: "Enter Event Description",
                        hintStyle: TextStyle(
                            color: Color(fontColorGray),
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeVertical * 1.75),
                      ),
                      onFieldSubmitted: (value){
                        eventDescFn.unfocus();
                        FocusScope.of(context).requestFocus(eventTopicFn);
                      },
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: Text(
                      "Topic",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: DropdownButtonFormField<String>(
                      focusNode: eventTopicFn,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(fontColorGray)),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                      ),
                      items: <String>['Topic 1', 'Topic 2', 'Topic 3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Color(midnightBlue),
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeVertical * 2),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Select a Topic",
                        style: TextStyle(
                            color: Color(fontColorGray),
                            fontSize: SizeConfig.blockSizeVertical * 1.75,
                            fontWeight: FontWeight.w400),
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(fontColorGray),
                      ),
                      value: topic,
                      onChanged: (value) {
                        setState(() {
                          topic = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: Text(
                      "Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: InkWell(
                      child: IgnorePointer(
                        child: TextFormField(
                          focusNode: eventDateFn,
                          controller: eventDate,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Select Date",
                            hintStyle: TextStyle(
                                color: Color(fontColorGray),
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeVertical * 1.75),
                            suffixIcon: Padding(
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color(fontColorGray),
                              ),
                            ),
                          ),
                          onFieldSubmitted: (value){
                            eventDateFn.unfocus();
                            FocusScope.of(context).requestFocus(eventTimeFn);
                          },
                          onTap: () {
                            selectDate(context);
                          },
                        ),
                      ),
                      onTap: () {
                        selectDate(context);
                      },

                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: Text(
                      "Time",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: InkWell(
                      child: IgnorePointer(
                        child: TextFormField(
                          focusNode: eventTimeFn,
                          controller: eventTime,
                          onChanged: (String val) {
                            _setTime = val;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Color(fontColorGray)),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Select Time",
                            hintStyle: TextStyle(
                                color: Color(fontColorGray),
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeVertical * 1.75),
                            suffixIcon: Padding(
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color(fontColorGray),
                              ),
                            ),
                          ),
                          onFieldSubmitted: (value){
                            eventTimeFn.unfocus();
                          },
                          textInputAction: TextInputAction.done,
                          onTap: () {
                            _selectFromTime(context);
                          },
                        ),
                      ),
                      onTap: () {
                        _selectFromTime(context);
                      },
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: Text(
                      "Price Per Ticket",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: Slider(
                      min: 0,
                      max: 100,
                      divisions: 99,
                      value: _value.toDouble(),
                      label: _value.toString(),
                      activeColor: Color(backgroundColorBlue),
                      inactiveColor: Color(fontColorGray),
                      onChanged: (value) {
                        setState(() {
                          _value = value.round();
                        });
                      },
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: Text(
                      "EVENT IMAGE",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                        vertical: SizeConfig.blockSizeVertical),
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Color(backgroundColorBlue),
                          )),
                      child: Text(
                        "Add image",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(backgroundColorBlue)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          bottomSheet: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.15,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7),
                  topLeft: Radius.circular(7),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 9.0,
                      spreadRadius: 4,
                      offset: Offset(1,1)
                  ),
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.04,
                          top: SizeConfig.blockSizeVertical * 2
                      ),
                      child: Row(
                        children: [
                          Text("Price For Event",
                            style: TextStyle(
                              color: Color(fontColorGray),
                              fontWeight: FontWeight.w400,
                            ),),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 3,
                          ),
                          Icon(Icons.info_outline_rounded,color: Color(fontColorGray),
                          size: SizeConfig.blockSizeVertical * 2,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.03
                      ),
                      child: Text("₹ 400",
                      style: TextStyle(
                        color: Color(backgroundColorBlue),
                        fontWeight: FontWeight.w600,
                      ),),
                    )
                  ],
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  alignment: Alignment.center,
                  child: MaterialButton(onPressed: (){
                    Navigator.of(context).pushNamed('/EventSummary');
                  },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text("CONTINUE",style: TextStyle(
                      color: Colors.white,
                    ),),
                    color: Color(backgroundColorBlue),
                    minWidth: SizeConfig.screenWidth * 0.5,),
                )
              ],
            ),
          ),
    ));
  }
}
