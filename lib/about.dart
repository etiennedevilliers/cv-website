import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
                  CircleAvatar(
                    minRadius: 100,
                    maxRadius: 130,
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                  Container(height: 10,),
                  Text(
                    "Etienne de Villiers",
                    textScaleFactor: 2,
                  ),
                  Container(
                    width: 500,
                    child:  Text(
                      "Team player | Loves Learning | Automation",
                      textScaleFactor: 1.3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                ],
              ),
    );
  }
}