// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        projectLinkCaption: "Visit PlayStore page",
        imageLink: "https://i.imgur.com/3qxe5CM.png"
      ),

      Project(
        "2020 Fish Feeder", 
        "Leaving pets at home over December holiday can be stressful. I grabbed some parts of ThingeyVerse, had them printed and started building. This little device has been faithfully feeding my fish every day at 7am since its completion in December 2020. Technologies used: Raspberry PI; Crontab; Telegram(Send notifaction when fed).", 
        imageLink: "https://i.imgur.com/U5T2YRR.jpg"
      ),

      Project(
        "2019 MrAuthenticator Bot", 
        "A Telegram bot built for Appsolve. This security bot notifies users when they log into Linux boxes. This is used to identify infrastructure breaches early. Technologies used: Python; SMTP(authenticating new users); shell trickery; sockets.", 
        imageLink: "https://i.imgur.com/VBiCV7o.png",
        projectLink: "https://gitlab.com/NitroFingers/mrauthenticator",
        projectLinkCaption: "Visit GitLab repo"
      ),
      Project(
        "2019 Code Game", 
        "Small project I did for fun. Its a puzzle game written in Python that uses Scratch type code blocks to arange & manipulate cubes. The goal is to write code that will take the the blocks from their starting positions to the defined end positions", 
        projectLink: "https://gitlab.com/NitroFingers/code-game-python",
        projectLinkCaption: "Visit GitLab repo",
        mediaLink: "https://i.giphy.com/media/Xd1LxWao8ECQRCuUev/giphy.mp4"
      )
  ];

  Widget buildItem(Project project) {
    return SizedBox(
      width: 700,
      child: Container(
        child:Card(
          child: Container(
            margin: EdgeInsets.all(10),
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
          )
          )
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: projects.map((project) {
            return buildItem(project);
          }).toList(),
        )
    );
  }
}