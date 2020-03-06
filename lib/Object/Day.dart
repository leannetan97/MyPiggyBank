class Day{
  DateTime _dateTime;

  Day(this._dateTime);

  // Getter
  String get time => '${_dateTime.hour}:${_dateTime.minute}:${_dateTime.second}';

  String get date => '${_dateTime.day}/${_dateTime.month}';

  String get fullDateTime => _dateTime.toString();

  String get nameOfTheDay{
    int day = (DateTime.parse('$fullDateTime')).weekday;
    switch(day){
      case 1:
        return 'MON';
        break;
      case 2:
        return 'TUE';
        break;
      case 3:
        return 'WED';
        break;
      case 4:
        return 'THU';
        break;
      case 5:
        return 'FRI';
        break;
      case 6:
        return 'SAT';
        break;
      case 7:
        return 'SUN';
        break;
      default:
        return '';
        break;
    }
  }



}