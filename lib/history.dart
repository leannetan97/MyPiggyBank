import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_piggy_bank/Utils/ColorsUtil.dart';
import 'package:my_piggy_bank/Utils/StringsUtil.dart';

import 'Object/Transaction.dart';

class History extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HistoryState();
}

class HistoryState extends State<History> {
  List<Transaction> _historyByCategory = [];
  String _monthValue = 'FEB';
  int _dayInMonth = 31;
  int _categoryNum = 5;
  int _iconIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: (_iconIndex == 0)? _dayInMonth + 3: _categoryNum + 3,
          itemBuilder: (context, index) {
            if (index == 0) return _mainTitleForTransactionActivity();
            if (index == 1) return _monthDropDownButton();
            if (index == 2) return selectIcons();
            //return _buildMainCardForOwingList(_settingNameList[index-3]);
            return Container();
          }),
    );
  }

  Widget _mainTitleForTransactionActivity() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${StringsUtil.transactionHistoryPageTitle}',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: ColorsUtil.blueViolet,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _monthDropDownButton() {
    return Container(
      alignment: Alignment.center,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${StringsUtil.monthLabel}',
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        DropdownButton<String>(
          value: _monthValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 16,
          elevation: 16,
          onChanged: (String newMonthValue) {
            _monthButtonOnChanged(newMonthValue);
          },
          items: <String>[
            'JAN',
            'FEB',
            'MAR',
            'APR',
            'MAY',
            'JUN',
            'JUL',
            'AUG',
            'SEP',
            'OCT',
            'NOV',
            'DEC'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ]),
    );
  }

  Widget selectIcons() {
    return Container(
        child: Row(children: <Widget>[
      Expanded(child: dayIcon()),
      Expanded(child: categoryIcon())
    ]));
  }

  Widget dayIcon() {
    return Column(children: <Widget>[
      CircleAvatar(
          child: IconButton(
            icon: Icon(Icons.today, color: ColorsUtil.white),
            onPressed: () {
              setState(() {
                _iconIndex = 0;
              });
            },
          ),
          backgroundColor:
              (_iconIndex == 0) ? ColorsUtil.secondaryColor : ColorsUtil.primaryColor,
          radius: 24),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Text('${StringsUtil.dateButtonLabel}', textAlign: TextAlign.center),
      )
    ]);
  }

  Widget categoryIcon() {
    return Column(children: <Widget>[
      CircleAvatar(
        child: IconButton(
            icon: Icon(
              Icons.category,
              color: ColorsUtil.white,
            ),
            onPressed: () {
              setState(() {
                _iconIndex = 1;
              });
            }),
        backgroundColor:
            (_iconIndex == 1) ? ColorsUtil.secondaryColor : ColorsUtil.primaryColor,
        radius: 24,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${StringsUtil.categoryButtonLabel}',
            textAlign: TextAlign.center),
      )
    ]);
  }

  void _monthButtonOnChanged(String newMonthValue) {}
}
