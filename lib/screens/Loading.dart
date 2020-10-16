


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/design/Design.dart';
import 'package:flutter_app/provider/WorldTime.dart';
import 'package:flutter_app/utilities/CommonTools.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class Loading extends StatefulWidget {

  

  @override
  State createState() {

    return _LoadingState();
  }
}



class _LoadingState extends State<Loading> {

  String data="loading data....";


  _LoadingState(){

      WorldTime("asia", "manila").getTime().then((value) =>  setState(() {
        String offset = value["utc_offset"].substring(1,3);
        DateTime date = DateTime.parse(value["datetime"]);
        date.add(Duration(hours: int.parse(offset)));
        data = DateFormat.jm().format(date);
      }));


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Loading", style: ts1), backgroundColor: Colors.black87,centerTitle: true,
      ),
      body: Center(
        child: FlatButton.icon(onPressed: (){
          callToast("From loading",context);
          Navigator.pushReplacementNamed(context,"/home",arguments: {"time":data});
        }, icon: Icon(Icons.play_arrow,color: Colors.amberAccent,), label: Text("$data")),
      ),
    );
  }
}


