// @dart=2.9

import 'package:cv_website/about.dart';
import 'package:cv_website/projects.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Etienne de Villiers | CV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      indicatorColor: Theme.of(context).canvasColor,
      tabs: [
        Tab(text: "About",),
        Tab(text: "Projects",),
      ],
    );

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            
            preferredSize: Size.copy(tabBar.preferredSize),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: tabBar,
            ),
          ),
          body: TabBarView(
            children: [
              AboutPage(),
              ProjectsPage()
            ],
          ),
        ),
      );
  }
}