import 'package:flutter/material.dart';
import 'dart:js' as js;

class SocialsPage extends StatelessWidget {

  Widget buildGithub() {
    return Container(
        width: 400,
        child: Card(
          child: ListTile(
            
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
            buildReferences()
          ],
        ),
      ) 
    );
  }
}