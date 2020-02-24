import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_piggy_bank/Utils/StringsUtil.dart';

import 'Utils/ColorsUtil.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '${StringsUtil.settingPageTitle}',
          ),
          backgroundColor: ColorsUtil.primaryColor,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            _defaultYearCell(),
            _defaultIncomeCell(),
            _categoryCell()
          ],
        )));
  }

  Widget _defaultYearCell() {
    return ListTile(
        title: Text('${StringsUtil.defaultYearLabel}'),
        trailing: Icon(Icons.chevron_right, size: 16),
        onTap: () => _changeDefault(StringsUtil.defaultYearLabel));
  }

  Widget _defaultIncomeCell() {
    return ListTile(
        title: Text('${StringsUtil.defaultIncomeLabel}'),
        trailing: Icon(Icons.chevron_right, size: 16),
        onTap: () => _changeDefault(StringsUtil.defaultIncomeLabel));
  }

  Widget _categoryCell() {
    return ListTile(
        title: Text('${StringsUtil.categoryLabel}'),
        trailing: Icon(Icons.chevron_right, size: 16),
        onTap: () => _categoryCellOnTap());
  }

  _changeDefault(String title) async {
    String defaultAns = '', hint = '', mainTitle = '';

    if (title == '${StringsUtil.defaultYearLabel}') {
      defaultAns = _getDefaultYear();
      hint = 'eg. 2010';
      mainTitle = '${StringsUtil.defaultYearLabel}';
    } else {
      defaultAns = _getDefaultIncome();
      hint = 'eg. 2500.00';
      mainTitle = '${StringsUtil.defaultIncomeLabel} (RM)';
    }

    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$mainTitle'),
          content: Row(
            children: <Widget>[
              new Expanded(
                  child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: '$mainTitle',
                    hintText: '$hint',
                    labelStyle: TextStyle(color: ColorsUtil.secondaryColor,),
                    hintStyle: TextStyle(color: ColorsUtil.secondaryColor),
                    fillColor: ColorsUtil.primaryColor,
                    focusColor: ColorsUtil.primaryColor,
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorsUtil.primaryColor,width: 2))),
                cursorColor: ColorsUtil.primaryColor,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  defaultAns = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('${StringsUtil.save}',
                  style: TextStyle(
                    color: ColorsUtil.primaryColor,
                    fontWeight: FontWeight.bold
                  )),
              onPressed: () {
                // Save updated
                (title == '${StringsUtil.defaultYearLabel}')
                    ? _saveDefaultYear(defaultAns)
                    : _saveDefaultIncome(defaultAns);
                Navigator.of(context).pop(defaultAns);
              },
            ),
          ],
        );
      },
    );
  }

  _categoryCellOnTap() {
    return _navigateToCategorySetting();
  }

  _navigateToCategorySetting() {
//    Navigator.of(context).push(route);
  }

  String _getDefaultYear() {
    return '';
  }

  String _getDefaultIncome() {
    return '';
  }

  void _saveDefaultYear(String year) {}

  void _saveDefaultIncome(String income) {}
}
