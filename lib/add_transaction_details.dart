import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Object/CategoryItem.dart';
import 'Object/Enums.dart';
import 'Object/Transaction.dart';
import 'Utils/StringsUtil.dart';
import 'Utils/ColorsUtil.dart';

class AddTransactionDetails extends StatefulWidget {
  final CategoryItem _icon;

  AddTransactionDetails(this._icon);

  @override
  State<StatefulWidget> createState() => AddTransactionDetailsState(_icon);
}

class AddTransactionDetailsState extends State<AddTransactionDetails> {
  final CategoryItem _icon;

  static List<String> _nameList = _getOwingNameList();
  String _amountEntered = '', _noteEntered = '', _nameSelected = 'me';
  double _widthOfScreen;

  OweType _oweType = OweType.None;
  DateTime _dateTime = DateTime.now();

  AddTransactionDetailsState(this._icon);

  @override
  Widget build(BuildContext context) {
    _widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: _pageTitle(),
          backgroundColor: ColorsUtil.primaryColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () => checkOnClick(),
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _dateCell(),
                _categoryCell(),
                _amountCell(),
                _noteTextCell(),
                _owingChoice(),
              ],
            ),
          ),
        ));
  }

  Widget _pageTitle() {
    return Container(
      child: Text('${StringsUtil.newTransactionDetailsTitle}'),
    );
  }

  Widget _dateCell() {
    String date = '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor))),
        child: ListTile(
            title: Text('${StringsUtil.dateLabel}'),
            trailing: GestureDetector(
              onTap: () {
                _showCalenderPicker();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    Text('$date'),
                    Icon(Icons.keyboard_arrow_right, size: 24),
                  ]),
            )));
  }

  Widget _categoryCell() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: ListTile(
        title: Text('Category\$'),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //TODO: chg the parameter pass in icon
//              IconButton(
//                icon:
                Icon(
                    IconData(
                      int.parse(_icon.iconCode),
                      fontFamily: 'MaterialIcons',
                    ),
                    size: 24),
//              ),
              Text((_icon.categoryName).replaceAll(new RegExp(r'\n'), ' ')),
//              IconButton(
//                icon: Icon(Icons.keyboard_arrow_right, size: 24),
//              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _amountCell() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: ListTile(
          title: Text('${StringsUtil.amountLabel}'),
          trailing: Container(
              padding: EdgeInsets.all(16),
              width: (_widthOfScreen / 2),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                    hintText: '${StringsUtil.amountHint}',
                    labelStyle: TextStyle(
                      color: ColorsUtil.secondaryColor,
                    ),
                    hintStyle: TextStyle(color: ColorsUtil.secondaryColor),
                    fillColor: ColorsUtil.primaryColor,
                    focusColor: ColorsUtil.primaryColor,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorsUtil.primaryColor, width: 2))),
                cursorColor: ColorsUtil.primaryColor,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _amountEntered = value;
                },
              ))),
    );
  }

  Widget _noteTextCell() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: ListTile(
        title: Text('${StringsUtil.notesLabel}'),
        trailing: Container(
            child: Container(
                padding: EdgeInsets.all(16),
                width: (_widthOfScreen / 2),
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: '${StringsUtil.notesHint}',
                      labelStyle: TextStyle(
                        color: ColorsUtil.secondaryColor,
                      ),
                      hintStyle: TextStyle(color: ColorsUtil.secondaryColor),
                      fillColor: ColorsUtil.primaryColor,
                      focusColor: ColorsUtil.primaryColor,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsUtil.primaryColor, width: 2))),
                  cursorColor: ColorsUtil.primaryColor,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    _noteEntered = value;
                  },
                ))),
      ),
    );
  }

  Widget _owingChoice() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                  title: Text('${StringsUtil.transactionTypeLabel}',
                      style: TextStyle(
                          color: ColorsUtil.primaryColor,
                          fontWeight: FontWeight.bold))),
              _radioChoiceListTile('${StringsUtil.noneLabel}', OweType.None),
              _radioChoiceListTile(
                  '${StringsUtil.oweLabel}', OweType.OweSomeone),
              _radioChoiceListTile(
                  '${StringsUtil.oweByLabel}', OweType.OweBySomeone),
            ]),
      ),
    );
  }

  Widget _radioChoiceListTile(String title, OweType type) {
    return ListTile(
      title: RadioListTile<OweType>(
        title: Text(title),
        value: type,
        groupValue: _oweType,
        onChanged: (OweType value) {
          setState(() {
            _oweType = value;
          });
        },
      ),
      trailing: (_oweType != OweType.None && _oweType == type)
          ? _dropdownNameList()
          : null,
    );
  }

  Widget _dropdownNameList() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DropdownButton<String>(
            hint: Text(
              'Me',
              style: TextStyle(color: ColorsUtil.secondaryColor),
            ),
            value: _nameSelected,
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorsUtil.black,
            ),
            iconSize: 20,
            elevation: 16,
            onChanged: (String name) {
              //TODO: update owe by or owe me name
              setState(() {
                _nameSelected = name;
              });
            },
            items: _nameList.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: ColorsUtil.black)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  double getAmountEntered() {
    // TODO: Handle other case
    if(_amountEntered.length == 0){
      _amountEntered = '0.0';
    }
    return double.parse(_amountEntered);
  }

  static _getOwingNameList() {
    //TODO: Query from DB
    return ['me', 'hello', 'world'];
  }

  checkOnClick() {
    //TODO： Save
    Transaction trans = new Transaction(DateTime.now(), getAmountEntered(), _icon, _noteEntered,
        _oweType, _nameSelected);

    //TODO: Find a better way to pop
    Navigator.of(context).pop();
    Navigator.of(context).pop();
//    Future.delayed(Duration.zero, () {
//      Navigator.of(context).popUntil(ModalRoute.withName('/home'));
//    });

  }

  _showCalenderPicker() async {
    final DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2020), // Starting date for the calender
      lastDate: DateTime(2222), // Last date for the calender
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );

    if (selectedDate != null && selectedDate != _dateTime)
      setState(() {
        print('Date Picker Updated: $selectedDate');
        _dateTime = selectedDate;
      });
  }
}
