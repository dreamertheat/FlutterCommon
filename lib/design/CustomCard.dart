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

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${loc.id}",style: ts1,),
              Text(loc.name,style: ts2,),
              IconButton(icon: Icon(Icons.map,color: Colors.blueAccent,), onPressed: delete)
            ],
          ),
        ),
      );
  }
}