import 'package:my_piggy_bank/Object/CategoryItem.dart';
import 'package:my_piggy_bank/calender.dart';

import 'Day.dart';
import 'Enums.dart';

class Transaction{
  double _amount;
  CategoryItem _category;
  String _name, _note;
  OweType _type;
  Day _day;

  Transaction(DateTime time, this._amount,this._category,this._note,this._type, this._name){
    _day = new Day(time);
  }

  // Getter
  // Day Object
  String get day => _day.nameOfTheDay;

  String get date => _day.date;

  String get time => _day.time;

  DateTime get dateTimeInDateTimeFormat => DateTime.parse('${_day.fullDateTime}');

  // Amount
  double get amount => _amount;

  // Note
  String get note => _note;

  // Name
  String get name => _name;

  // Transaction type
  OweType get type => _type;

  // Category
  String get categoryName => _category.categoryName;

  String get categoryIconCode => _category.iconCode;

  bool get isCategoryCounted => _category.isCounted;
}