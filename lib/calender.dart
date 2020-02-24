import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_piggy_bank/Utils/ColorsUtil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Calender extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CalenderState();
}

class CalenderState extends State<Calender>{
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      locale: 'en_US',
      //TODO: Navigate to add new transaction
      onDayLongPressed: (dateTime,list){ _navigateToAddTransaction(dateTime,list);},
    onDaySelected: (dateTime,list){_showDayTransaction(dateTime,list);},
    );
  }

  // TODO:
  void _showDayTransaction(DateTime dateTime, List<dynamic> list) {
    Fluttertoast.showToast(
        msg: "Show Transaction Press $dateTime, $list",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black12,
        textColor: ColorsUtil.black,
        fontSize: 16.0
    );
  }

  void _navigateToAddTransaction(DateTime dateTime, List<dynamic> list) {
    Fluttertoast.showToast(
        msg: "Long Tap $dateTime",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black12,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }



}