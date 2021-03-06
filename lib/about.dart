// @dart=2.9

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class AboutPage extends StatelessWidget {
  List<String> subtitles = [
    "I like Arduinos/IoT, automation, scripting and playing around with technology."
  ];

  String moreInfo = "I'm currently studying at Belgium Campus towards my Bachelors in Computing. I matriculated from Hoërskool Eldoraigne in 2018.\n\nDuring my time in High School, I attended a robotics course(XRobotics). This is what got me into embedded computing and very excited about automation & IoT. Currently, I do part-time scripting and mobile development for Appsolve Pty (LTD) to gain work experience.\n\nMy hobbies include automating my aquarium, playing with Arduinos/IoT and occasionally coding for fun.";

  Map<String, double> languagesSkills = {
    "Python" : 0.9,
    "Dart" : 0.8,
    "C#" : 0.6,
    "Java" : 0.6,
    "SQL" : 0.55,
  };

  Map<String, double> frameworkSkills = {
    "Flutter" : 0.9,
    "Flask" : 0.4,
    "Node JS" : 0.4,
  };

  Map<String, double> otherSkills = {
    "Team work" : 1,
    "Getting things done" : 1,
    "Linux Command line" : 0.6,
    "Swagger" : 0.5,
  };

  List<String> personalCareerGoals = [
    "Achieve DevOps Engineer status",
    "Skilled at training & knowledge sharing",
  ];

  List<String> longTermInterests = [
    "Arduinos & IoT",
    "Aquariums",
    "Chess",
    "Collect them all: Linux, macOS, Windows"
  ];

  List<String> softSkills = [
    "Time Management",
    "Team work",
    "Communication",
    "Highly adaptable"
  ];

  Widget buildRatingList(BuildContext context, Map<String, double> skills) {
    return Column(
          children: skills.keys.map((skill) {
            return Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  Text(skill),
                  Expanded(child: Container()),
                  Container(
                    width: 110,
                    height: 20,
                    child: LiquidLinearProgressIndicator(
                      value: 1 - skills[skill],
                      backgroundColor: Theme.of(context).primaryColor,
                      valueColor: AlwaysStoppedAnimation(
                        Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
  }

  Widget buildSkills(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 480,
        minWidth: 300,
        maxWidth: 300,
      ),
      child: Card(
        child: Container(
          
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: Text("Skills", textScaleFactor: 1.2,),
              ),
              Divider(),
              Text("Languages"),
              buildRatingList(context, languagesSkills),
              Text("Frameworks"),
              buildRatingList(context, frameworkSkills),
              Text("Other"),
              buildRatingList(context, otherSkills)
            ],
          ),
        )
    ));
  }

  Widget buildInterestList(List<String> interests) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: interests.map((interest) {
          return Container(
            margin: EdgeInsets.all(5),
            child: Text("- ${interest}")
          );
        }).toList()
      )
    );
  }

  Widget buildInterests() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 480,
        minWidth: 300,
        maxWidth: 300,
      ),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: Text("Personal", textScaleFactor: 1.2,),
              ),
              Divider(),
              Text("Long term Interests"),
              buildInterestList(longTermInterests),
              Text("Personal career Goals"),
              buildInterestList(personalCareerGoals),
              Text("Soft Skills"),
              buildInterestList(softSkills)
            ],
          ),
        )
    ));
  }

  Widget buildInfo() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 600,
      ),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: Text("About", textScaleFactor: 1.2,),
              ),
              Divider(),
              
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: Text(moreInfo),
              ),
            ],
          ),
        )
    ));
  }

  Widget buildSubtitle() {
    return Container(
        width: 500,
        child:  Column(
          children: subtitles.map((text) {
              return Text(
                text,
                textScaleFactor: 1.4,
                textAlign: TextAlign.center,
              );
            }).toList(),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:Padding(
      padding: EdgeInsets.all(40),
      child: Column (
        children: [
          CircleAvatar(
            minRadius: 100,
            maxRadius: 130,
            backgroundImage: AssetImage('images/avatar.png'),
          ),
          Container(height: 10,),
          Text(
            "Hi, I am Etienne de Villiers.",
            textScaleFactor: 2,
          ),
          Container(height: 10,),
          buildSubtitle(),
          Container(height: 20,),
          buildInfo(),
          Wrap(
            children: [
              buildSkills(context),
              buildInterests()
            ],
          ),
        ],
      ),
    ));
  }
}