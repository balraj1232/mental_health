import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

class AvailabilityFirst extends StatefulWidget {
  const AvailabilityFirst({Key key}) : super(key: key);

  @override
  _AvailabilityFirstState createState() => _AvailabilityFirstState();
}

class _AvailabilityFirstState extends State<AvailabilityFirst> {

 bool expanded = false;
 List<String> days = ['S','M','T','W','T','F','S'];
 List<bool> selected = [false,false,false,false,false,false,false];
 bool checked = false;

  String _setTime, _setDate;

  String _hourFrom, _minuteFrom, _timeFrom;
  String _hourTo, _minuteTo, _timeTo;


  String dateTimeFrom;
  String dateTimeTo;

  DateTime selectedDate = DateTime.now();


  TimeOfDay selectedTimeFrom = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedTimeTo = TimeOfDay(hour: 00, minute: 00);


  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _timeToController = TextEditingController();


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
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
        _timeController.text = _timeFrom;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTimeFrom.hour, selectedTimeFrom.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }
  Future<Null> _selectToTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeTo,
    );
    if (picked != null)
      setState(() {
        selectedTimeTo = picked;
        _hourTo = selectedTimeTo.hour.toString();
        _minuteTo = selectedTimeTo.minute.toString();
        _timeTo = _hourTo + ' : ' + _minuteTo;
        _timeToController.text = _timeTo;
        _timeToController.text = formatDate(
            DateTime(2019, 08, 1, selectedTimeTo.hour, selectedTimeTo.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();

    _timeToController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dateTimeFrom = DateFormat.yMd().format(DateTime.now());
    dateTimeTo = DateFormat.yMd().format(DateTime.now());
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
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
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('/Availability1');
            },
            child: Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal * 5

              ),
              child:Container(
                alignment: Alignment.center,
                child: Text("Save",
                  style: TextStyle(
                      color: Color(backgroundColorBlue),
                      fontWeight: FontWeight.w600
                  ),),
              ),
            ),
          ),
        ],
      ),
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
                vertical: SizeConfig.blockSizeVertical,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.02
                          ),
                          child: Text("FROM",
                            style: TextStyle(
                                color: Color(fontColorGray),
                                fontSize: SizeConfig.blockSizeVertical * 1.5,
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                        InkWell(
                          onTap: () {
                            _selectFromTime(context);
                          },
                          child: Container(
                            width: SizeConfig.screenWidth * 0.4,
                            child: TextFormField(
                              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 4,
                              color: Color(midnightBlue)),
                              onSaved: (String val) {
                                _setTime = val;
                              },
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _timeController,
                              decoration: InputDecoration(
                                  disabledBorder:
                                  UnderlineInputBorder(borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.02,
                          ),
                          child: Text("TO",
                            style: TextStyle(
                                color: Color(fontColorGray),
                                fontSize: SizeConfig.blockSizeVertical * 1.5,
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                        InkWell(
                          onTap: () {
                            _selectToTime(context);
                          },
                          child: Container(
                            width: SizeConfig.screenWidth * 0.4,
                            child: TextFormField(
                              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 4,
                              color: Color(midnightBlue)),
                              onSaved: (String val) {
                                _setTime = val;
                              },
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _timeToController,
                              decoration: InputDecoration(
                                  disabledBorder:
                                  UnderlineInputBorder(borderSide: BorderSide.none),
                                  // labelText: 'Time',
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                if(expanded == false)
                setState(() {
                  expanded = true;
                });
                else
                  setState(() {
                    expanded = false;
                  });
                },
              child: Container(
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.05,
                  vertical: SizeConfig.blockSizeVertical,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("REPEAT",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(fontColorGray),
                    ),),
                    Icon(expanded == false ? Icons.keyboard_arrow_down_rounded
                       : Icons.keyboard_arrow_up_rounded,color: Color(fontColorGray),),
                  ],
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.05,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.blockSizeVertical,
              ),
              child: ListView.builder(itemBuilder: (BuildContext context, int index){
                return MaterialButton(onPressed: (){
                  if(selected[index] == false)
                    {
                      setState(() {
                        selected[index] = true;
                      });
                    }
                  else
                    setState(() {
                      selected[index] = false;
                    });
                },
                child: Text(days[index],
                style: TextStyle(
                  color: selected[index] == true ? Colors.white : Color(0XFF383838)
                ),),
                color: selected[index] == true ? Color(backgroundColorBlue) : Colors.white,
                minWidth: SizeConfig.screenWidth * 0.1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
                elevation: 0.0,);
              },
              itemCount: days.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            expanded == true ?
            CalendarDatePicker(initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2050),
                initialCalendarMode: DatePickerMode.day,
                onDateChanged: (date){
              setState(() {
                selectedDate = date;
              });
                }) : SizedBox(
              width: SizeConfig.screenWidth,
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.blockSizeVertical
              ),
              child: CheckboxListTile(
                value: checked,
                onChanged: (value){
                  setState(() {
                    checked = value;
                  });
                },
                title: Text("Provide 30 minutes break after each session"),
                dense: true,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Color(backgroundColorBlue),
                checkColor: Colors.white,

              ),
            ),
          ],
        ),
      ),
    ));
  }
}
