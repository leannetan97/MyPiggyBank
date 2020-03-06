import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Utils/StringsUtil.dart';
import 'Utils/ColorsUtil.dart';

class OwingNameList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OwingNameListState();
}

class OwingNameListState extends State<OwingNameList> {
  List<String> _nameList = ['Me'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${StringsUtil.owingListTitle}'),
          backgroundColor: ColorsUtil.primaryColor,
        ),
        body: Container(
            child: Column(
          children: <Widget>[for (String name in _nameList) _nameCell(name)],
        )),
        floatingActionButton: _addFloatingButton());
  }

  Widget _addFloatingButton() {
    return FloatingActionButton(
      onPressed: () => _addFloatingButtonIdPressed(),
      tooltip: StringsUtil.transactionTooltip,
      child: Icon(Icons.add),
    );
  }

  Widget _nameCell(String name) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: ListTile(
        title: Text('$name'),
        trailing: (name == 'Me')
            ? Container(child:Text('${StringsUtil.defaultLabel}'),decoration: BoxDecoration(border: Border.all(color: ColorsUtil.primaryColor),borderRadius: BorderRadius.circular(8)),)
            : Container(child: IconButton(
          icon: Icon(Icons.delete_forever,size: 24,),
          onPressed: () => _deleteIconPressed(name),
        ),)
      ),
    );
  }

  _deleteIconPressed(String name) {
    setState(() {
      _nameList.remove(name);
    });
  }

  _addName(String newName) {
    setState(() {
      _nameList.add(newName);
    });
  }

  _addFloatingButtonIdPressed() {
    String mainTitle = '${StringsUtil.newNameLabel}';
    String hint = '(eg. Leanne)';
    String newName = '';

    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${StringsUtil.newNameLabel}'),
          content: Row(
            children: <Widget>[
              new Expanded(
                  child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: '$mainTitle',
                    hintText: '$hint',
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
                  newName = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('${StringsUtil.save}',
                  style: TextStyle(
                      color: ColorsUtil.primaryColor,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                // Save updated
                _addName(newName);
                Navigator.of(context).pop(newName);
              },
            ),
          ],
        );
      },
    );
  }
}
