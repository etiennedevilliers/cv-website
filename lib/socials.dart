import 'package:flutter/material.dart';
import 'dart:js' as js;

class SocialsPage extends StatelessWidget {

  Widget buildGithub() {
    return Container(
        width: 400,
        child: Card(
          child: ListTile(
            leading: Image.network("https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"),
            title: Text("Github Profile"),
            subtitle: Text("etiennefdevilliers"),
            trailing: MaterialButton(
              child: Text("Visit"),
              onPressed: () {
                      js.context.callMethod('open', ['https://github.com/etiennedevilliers']);
              }, 
            ),
          )
        )
    );
  }

  Widget buildGitlab() {
    return Container(
        width: 400,
        child: Card(
          child: ListTile(
            leading: Image.asset('images/gitlab-icon-rgb.png'),
            title: Text("Gitlab Profile"),
            subtitle: Text("NitroFingers"),
            trailing: MaterialButton(
              child: Text("Visit"),
              onPressed: () {
                      js.context.callMethod('open', ['https://gitlab.com/NitroFingers']);
              }, 
            ),
          )
        )
    );
  }

  Widget buildContactsCard() {
    return Container(
        width: 400,
        alignment: Alignment.topLeft,
        child: Card(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Contact details")
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("- 060 527 2390"),
                Text("- etiennefdevilliers@gmail.com"),
                Text("- 576385@student.belgiumcampus.ac.za"),
              ],)
            )
          ],)
        )
    );
  }

  Widget buildReferences() {
    return Container(
        width: 400,
        alignment: Alignment.topLeft,
        child: Card(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("References")
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("- Appsolve (Pty) Ltd"),
                Text("  Andre Pelser 083 257 1626"),
                Text("  Hein Blignaut 082 901 6688"),
              ],)
            )
          ],)
        )
    );
  }

  Widget buildResourceCard() {
    return Container(
        width: 400,
        alignment: Alignment.topLeft,
        child: Card(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.download),
              title: Text("Resources")
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  child: Text("Download CV"),
                  onPressed: () {
                    js.context.callMethod('open', ["https://drive.google.com/file/d/1ZizElBryPODyeLZRbm5mDuNxU9uB9TnU/view?usp=sharing"]);
                  }
                ),
              ],)
            )
          ],)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 800
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            buildGithub(),
            buildGitlab(),
            buildContactsCard(),
            buildReferences(),
            buildResourceCard()
          ],
        ),
      ) 
    );
  }
}