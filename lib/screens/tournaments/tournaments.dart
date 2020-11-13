import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TournamentsWidget extends StatefulWidget {
  @override
  TournamentsWidgetState createState() {
    return TournamentsWidgetState();
  }
}

class TournamentsWidgetState extends State<TournamentsWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(children: [
          Image.asset('assets/images/menu.png', height: 25, width: 25,),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(right: 25),

            child: Text("Flying Wolf",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,),
          ))

        ],),
      ),
      body: Row(),
    );
  }
}
