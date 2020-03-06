import 'package:flutter/material.dart';
import 'package:my_piggy_bank/settings.dart';

import 'Utils/ColorsUtil.dart';
import 'Utils/StringsUtil.dart';
import 'calender.dart';
import 'history.dart';
import 'home.dart';
import 'package:my_piggy_bank/Utils/StringsUtil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsUtil.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/home': (context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsUtil.appName),
          backgroundColor: ColorsUtil.primaryColor,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calendar_today)),
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.event_note)),
            ],
          ),
          actions: <Widget>[_settingIcon()],
        ),
        body: TabBarView(children: <Widget>[Calender(), Home(), History()]),
      ),
    );
  }

  Widget _settingIcon(){
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: <Widget>[Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: IconButton(icon:Icon(Icons.settings),
        onPressed: ()=> _navigateToSettingPage(),
        ),
      )]),
    );
//    ,Text('${StringsUtil.settingPageTitle}')
  }

  _navigateToSettingPage() {
     Navigator.of(context).push(MaterialPageRoute<void>(settings:  RouteSettings(name: '${StringsUtil.settingsPage}',), builder:(context) => Settings()));
  }


}
