


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/design/Design.dart';
import 'package:flutter_app/utilities/CommonTools.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Loading", style: ts1), backgroundColor: Colors.black87,centerTitle: true,
      ),
      body: Center(
        child: FlatButton.icon(onPressed: (){
          callToast("From loading",context);
          Navigator.pushNamed(context,"/home");
        }, icon: Icon(Icons.play_arrow,color: Colors.amberAccent,), label: Text("")),
      ),
    );
  }
}
