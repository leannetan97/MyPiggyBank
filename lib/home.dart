import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_piggy_bank/Object/Enums.dart';
import 'package:my_piggy_bank/Object/Transaction.dart';
import 'package:my_piggy_bank/Utils/ColorsUtil.dart';
import 'package:my_piggy_bank/Utils/StringsUtil.dart';

import 'Object/CategoryItem.dart';
import 'add_transaction.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  String _monthValue = 'FEB';
  double _income = 0.00, _expenses = 0.00, _balance = 0.00;
  List<String> _settingNameList = ['Hello', 'World', 'BB'];
  List<Transaction> _owingList = [
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
    new Transaction(
        DateTime.now(),
        234.50,
        new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
        '',
        OweType.OweSomeone,
        'BB'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: _settingNameList.length + 3,
            itemBuilder: (context, index) {
              if (index == 0) return _monthDropDownButton();
              if (index == 1) return _summaryStatusCard();
              if (index == 2) return _buildTitleForOwingList();
              return _buildMainCardForOwingList(_settingNameList[index - 3]);
            }),
        floatingActionButton: _addFloatingButton());
  }

  // region DropDownButton
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

  // endregion DropDownButton

  // region SummaryCard
  Widget _summaryStatusCard() {
    return Card(
        margin: EdgeInsets.all(16),
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _detailsInStatusCard(StringsUtil.incomeLabel, _income.toString()),
              Container(
                  width: 2,
                  height: 32,
                  decoration: BoxDecoration(color: ColorsUtil.blueViolet)),
              _detailsInStatusCard(
                  StringsUtil.expensesLabel, _expenses.toString()),
              Container(
                  width: 2,
                  height: 32,
                  decoration: BoxDecoration(color: ColorsUtil.blueViolet)),
              _detailsInStatusCard(
                  StringsUtil.balanceLabel, _balance.toString())
            ],
          ),
        ));
  }

  Widget _detailsInStatusCard(String label, String amount) {
    return Container(
      child: Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(fontSize: 20),
                ),
                Text(amount, style: TextStyle(fontSize: 16))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleForOwingList() {
    return Center(
      child: Text(
        '${StringsUtil.owingListTitle}',
        style: TextStyle(color: ColorsUtil.blueViolet, fontSize: 20.0),
      ),
    );
  }

  Widget _buildMainCardForOwingList(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Card(
          color: ColorsUtil.primaryColor,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _buildMainCardTitleForOwingList(name),
                _buildCardForTransaction()
              ],
            ),
          )),
    );
  }

  Widget _buildMainCardTitleForOwingList(String name) {
    double debt = _calculatePayBack();
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(children: <Widget>[
          Expanded(
              child: Text(name,
                  style: TextStyle(
                      color: ColorsUtil.white, fontWeight: FontWeight.bold))),
          Text(
            '${StringsUtil.paybackLabel} $debt',
            textAlign: TextAlign.end,
            style:
                TextStyle(color: ColorsUtil.white, fontWeight: FontWeight.bold),
          )
        ]));
  }

  Widget _buildCardForTransaction() {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                for (var trans in _owingList) _rowShowingTransaction(trans)
              ],
            )));
  }

  Widget _rowShowingTransaction(Transaction t) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Row(children: <Widget>[
          Text(
            t.date,
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            ' (${t.day})  ',
            style: Theme.of(context).textTheme.caption,
          ),
          Icon(
            IconData(
              int.parse(t.categoryIconCode),
              fontFamily: 'MaterialIcons',
            ),
            size: 16,
            color: ColorsUtil.black,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((t.categoryName).replaceAll(new RegExp(r'\n'), ' ')),
          )),
          Text(
            t.amount.toString(),
            textAlign: TextAlign.end,
            maxLines: 2,
          )
        ]));
  }

  Widget _addFloatingButton() {
    return FloatingActionButton(child: Icon(Icons.add),
        backgroundColor: ColorsUtil.secondaryColor,
      onPressed: () => _newTransactionIsPressed(),
      tooltip: StringsUtil.transactionTooltip,
    );
  }

  double _calculatePayBack() {
    return 0.0;
  }

  _newTransactionIsPressed() {
    _navigateToAddNewTransaction();
  }

  void _monthButtonOnChanged(String newMonthValue) {
    setState(() {
      _monthValue = newMonthValue;
    });
  }

  _navigateToAddNewTransaction() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        settings: RouteSettings(
          name: '${StringsUtil.addTransactionPage}',
        ),
        builder: (context) => AddTransaction()));
  }
}
