


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/design/Design.dart';
import 'package:flutter_app/provider/WorldTime.dart';
import 'package:flutter_app/utilities/CommonTools.dart';
import 'package:http/http.dart';


class Loading extends StatefulWidget {

  

  @override
  State createState() {

    return _LoadingState();
  }
}



class _LoadingState extends State<Loading> {

  String name="loading data....";


  _LoadingState(){

      WorldTime("asia", "manila").getTime().then((value) =>  setState(() {
        name = value;
      }));


  }



  @override
  Widget build(BuildContext context) {
    print(name);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Loading", style: ts1), backgroundColor: Colors.black87,centerTitle: true,
      ),
      body: Center(
        child: FlatButton.icon(onPressed: (){
          callToast("From loading",context);
          Navigator.pushNamed(context,"/home");
        }, icon: Icon(Icons.play_arrow,color: Colors.amberAccent,), label: Text("$name")),
      ),
    );
  }
}


