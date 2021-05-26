// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'dart:js' as js;


class Project{
  String title;
  String description;
  String mediaLink;
  String imageLink;
  String projectLink;
  String projectLinkCaption;

  Project(this.title, this.description, {this.projectLink, this.projectLinkCaption, this.mediaLink, this.imageLink});
}


            

class ProjectsPage extends StatelessWidget {
  List<Project> projects = [
      Project(
        "2020 BeBanking mobile app", 
        "BeBanking is a payment approval service created by Appsolve (Pty) Ltd. I was given the oppertunity to write their mobile iOS & Android app using Flutter. The project came to a conclusion at the end of 2020. This was a great learning oppertunity for me as I had the chance to take a project from design to publishing it the appstore. Technologies include: Flutter, Firebase messanging & REST services", 
        projectLink: "https://play.google.com/store/apps/details?id=co.za.appsolve.bebanking&hl=en&gl=US",
        projectLinkCaption: "Goto PlayStore",
        imageLink: "https://i.imgur.com/3qxe5CM.png"
      ),

      Project(
        "2020 Fish Feeder", 
        "Leaving pets at home over December holiday can be stressful. I grabbed some parts of ThingeyVerse, had them printed and started building. This little device has been faithfully feeding my fish every day at 7am since it completion in December 2020. Technologies used: Raspberry PI; Crontab; Telegram(Send notifaction when fed).", 
        imageLink: "https://i.imgur.com/U5T2YRR.jpg"
      ),

      Project(
        "2019 Code Game", 
        "Small project I did for fun. Its a puzzle game written in Python that uses Scratch type code blocks to arrange & manipulate cubes.", 
        projectLink: "https://gitlab.com/NitroFingers/code-game-python",
        projectLinkCaption: "Visit GitLab repo",
        mediaLink: "https://i.giphy.com/media/Xd1LxWao8ECQRCuUev/giphy.mp4"
      )
  ];

  Widget buildItem(Project project) {
    return Card(
      child: Column(
        children: [ 
          ListTile(
            title: Text(project.title),
            subtitle: Text(project.description),
          ),
          SizedBox(
            width: 400,
            child: Container(
              child: project.mediaLink != null ? html.Html(
                data : "<video src=\"${project.mediaLink}\" controls>"
              ) : null
            )
          ),
          SizedBox(
            width: 400,
            child: project.imageLink != null ? Image.network(project.imageLink) : null
          ),
          project.projectLink != null ? Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                js.context.callMethod('open', [project.projectLink]);
              }, 
              child: Text(project.projectLinkCaption)
            ),
          ) : Container(),
          
        ]
        )
      );

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: projects.map((project) {
        return buildItem(project);
      }).toList(),
    );
  }
}