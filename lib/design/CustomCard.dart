import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Locationee.dart';

import 'Design.dart';

class CustomCard extends StatelessWidget {

  final Locationee loc;
  final Function delete;

  CustomCard(this.loc,this.delete);

  @override
  Widget build(BuildContext context) {
    return

      Card(
        color: Colors.blueGrey,
        child: Padding(

          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${loc.id}  - ",style: ts1,),
                  Text(loc.name,style: ts3,),
                  IconButton(icon: Icon(Icons.gps_fixed,color: Colors.redAccent,size: 50,), onPressed: delete)
                ],
              )

            ],
          ),
        ),
      );
  }
}