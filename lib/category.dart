import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Object/CategoryItem.dart';
import 'Utils/StringsUtil.dart';
import 'Utils/ColorsUtil.dart';

class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CategoryState();
}

class CategoryState extends State<Category> {
  String _dropdownTransactionType = '${StringsUtil.expensesLabel}';
  List<CategoryItem> _categoryExpensesList = [
    new CategoryItem('0xe57a', 'Meal\n(F&B)', true),
    //Icons.fastfood

    new CategoryItem('0xe854', 'Groceries/\nShopping', true),
    //Icons.shopping_cart

    new CategoryItem('0xe531', 'Transport', true),
    //Icons.directions_car

    new CategoryItem('0xe338', 'Entertainment', true),
    //Icons.videogame_asset

    new CategoryItem('0xe838', 'Religion/\nDonation', true),
    //Icons.star

    new CategoryItem('0xe546', 'Petrol', true),
    //Icons.local_gas_station

    new CategoryItem('0xe548', 'Health', true),
    //Icons.local_hospital

    new CategoryItem('0xe32a', 'Insurance', true),
    //Icons.security

    new CategoryItem('0xe337', 'Tecbnology', true),
    //Icons.devices_other

    new CategoryItem('0xe91d', 'Pets', true),
    //Icons.pets

    new CategoryItem('0xe431', 'Book', true),
    //Icons.collections_bookmark

    new CategoryItem('0xe02f', 'Bill', true),
    //Icons.library_books

    new CategoryItem('0xe870', 'Bank/\nInvestment', true),
    //Icons.credit_card

    new CategoryItem('0xe7ef', 'Parents', true),
    //Icons.group

    new CategoryItem('0xeb3f', 'Office/\nWork', true),
    //Icons.business_center

    new CategoryItem('0xe6dd', 'Other', true),
    //Icons.bubble_chart

    // Not added in total expenses
    new CategoryItem('0xe850', 'Savings', false),
    //Icons.account_balance_wallet

    new CategoryItem('0xe5c8', 'Pay Back', false),
    //Icons.arrow_forward

    //Also can like this
//    new CategoryItem((Icons.business_center.codePoint).toString(), 'Office / Work')
  ];

  List<CategoryItem> _categoryIncomeList = [
    new CategoryItem('0xe227', 'Salary', true),
    //Icons.attach_money

    new CategoryItem('0xe01d', 'Investment', false),
    //Icons.equalizer

    new CategoryItem('0xe546', 'Rewards/\nAllowance', false),
    //Icons.local_gas_station

    new CategoryItem('0xe042', 'Refund', true),
    //Icons.replay
  ];
  // Only Include Salary and Refund is added in Total Income


//  CategoryItem _iconSelected = _categoryExpensesList[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _pageTitle(),
          backgroundColor: ColorsUtil.primaryColor,
        ),
        body: _iconList());
  }

  Widget _pageTitle() {
    return Container(
      child: Row(
        children: <Widget>[
          Text('${StringsUtil.categoryPageTitle}'),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: ColorsUtil.primaryColor),
              child: DropdownButton<String>(
                value: _dropdownTransactionType,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: ColorsUtil.white,
                ),
                iconSize: 20,
                elevation: 16,
                onChanged: (String type) {
                  _dropdownOnChanged(type);
                },
                items: <String>[
                  '${StringsUtil.expensesLabel}',
                  '${StringsUtil.incomeLabel}'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child:
                        Text(value, style: TextStyle(color: ColorsUtil.white)),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconList() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            direction: Axis.horizontal,
            children: (_dropdownTransactionType ==
                    '${StringsUtil.expensesLabel}')
                ? <Widget>[
                    for (CategoryItem x in _categoryExpensesList)
                      _iconAndName(x)
                  ]
                : <Widget>[
                    for (CategoryItem x in _categoryIncomeList) _iconAndName(x)
                  ]),
      ),
    );
  }

  Widget _iconAndName(CategoryItem c) {
    return Container(
        height: 80,
        width: 80,
        child: Column(children: <Widget>[
          CircleAvatar(
            radius: 24,
            child: IconButton(
              icon: Icon(
                IconData(
                  int.parse(c.iconCode),
                  fontFamily: 'MaterialIcons',
                ),
                color: ColorsUtil.white,
              ),
              onPressed: () => _iconSelected(c),
            ),
            backgroundColor: ColorsUtil.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
            child: Text(
              '${c.categoryName}',
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          )
        ]));
  }


  _dropdownOnChanged(String type) {
    setState(() {
      _dropdownTransactionType = type;
    });
  }

  _iconSelected(CategoryItem c) {
    setState(() {
      //TODO:
    });
  }
}
