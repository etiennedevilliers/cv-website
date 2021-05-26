import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'dart:js' as js;



class ProjectsPage extends StatelessWidget {

  Widget buildItem(String title, String description, String? media, String link) {
    return Card(
      child: Column(
        children: [ 
          ListTile(
            title: Text(title),
            subtitle: Text(description),
          ),
          TextButton(
            onPressed: () {
              js.context.callMethod('open', [link]);
            }, 
            child: Text("Open project page")
          ),
          Container(
            child: media != null ? html.Html(
              data : "<video src=\"${media}\" controls>"
            ) : null
          )
        ]
        )
      );

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildItem(
            "Code Game", 
            "A puzzle game written in Python that uses Scratch type code blocks to arrange & manipulate cubes.",
            "https://i.giphy.com/media/Xd1LxWao8ECQRCuUev/giphy.mp4",
            "https://gitlab.com/NitroFingers/code-game-python"
        ),
      ],
    );
  }
}