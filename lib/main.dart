import 'package:flutter/material.dart';

import 'Utils/ColorsUtil.dart';
import 'Utils/StringsUtil.dart';
import 'calender.dart';
import 'details.dart';
import 'home.dart';

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
          backgroundColor: ColorsUtil.green,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calendar_today)),
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.event_note)),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[Calender(), Home(), Details()]),
      ),
    );
  }
}
