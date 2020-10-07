import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/design/CustomCard.dart';
import 'package:flutter_app/design/Design.dart';
import 'package:flutter_app/models/Locationee.dart';
import 'package:flutter_app/utilities/CommonTools.dart';




class Home extends StatefulWidget {

  @override
  State createState() {
    print("HOME STATE CALLED");
    return HomeState();
  }
}


double manipulator(double num){
  logger(2);
  return num + (Random().nextInt(10));
}


void logger(int seconds)async {
  String x = await Future.delayed(Duration(seconds: 5), (){
    return "logger1";
  });
  String y =  await Future.delayed(Duration(seconds: 3), (){
    return "logger2"+x;
  });

  String z =  await Future.delayed(Duration(seconds: 3), (){
    return "logger3"+y;
  });
  String v =  await Future.delayed(Duration(seconds: 3), (){
    return "logger4"+z;
  });

  print("loggerAll "+v);
}



List<Locationee> locations = [
  Locationee(1,"Manila","34,2","12-01-09"),
  Locationee(2,"Marikina","67,66","09-01-09"),
  Locationee(3,"Makati","98,24","08-01-09"),
  Locationee(4,"Taguig","110,333","07-01-09"),
  Locationee(5,"San Mateo","210,233","06-01-09"),

];

class HomeState extends State<Home> {

  double count = 0.0;

  @override
  Widget build(BuildContext context) {
    print("rebuilding home");
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Container(child: Image.network('https://i.imgur.com/kGjXf.jpg')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ setState(() {
          count = manipulator(count);
        });},
        child: Icon(Icons.whatshot),
      ),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        title: Text("LE PROFILE",style: ts1),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: CircleAvatar(backgroundImage: NetworkImage('https://i.imgur.com/kGjXf.jpg'), radius: 50, backgroundColor: Colors.black,)),
                Divider(height: 60, color: Colors.grey[100]),
                Text('NAME',style: ts2),
                SizedBox(height: 10,),
                Text("MIZOWA BASTION",style: ts3),
                SizedBox(height: 30,),
                Text('STATUS',style: ts2),
                SizedBox(height: 10,),
                Text('MISSING',style: warning),
                SizedBox(height: 10,),
                Text('THREAT LEVEL',style: ts2),
                SizedBox(height: 10,),
                Text('URBAN 3-A',style: warning),
                SizedBox(height: 10,),
                Text('KILLS',style: ts2),
                SizedBox(height: 10,),
                Text('$count',style: warning),
                SizedBox(height: 20,),
                Center(child: Text('RECENT LOCATIONS',style: ts2)),
                SizedBox(height: 10,),
                Container(
                  child: Column(children:
                  locations.map((e) => CustomCard(e,(){
                    callToast(e.coordinates,context); setState(() {
                    locations.remove(e);
                  }); })).toList()
                  ),
                ),










                SizedBox(height: 50,),

                Row(

                  children: [
                    Icon(Icons.email,color:Colors.grey),
                    SizedBox(width: 10,),
                    Text("mizowamar@ownage.com", style:ts0)

                  ],

                ),
                Row(

                  children: [
                    Icon(Icons.phone,color:Colors.grey),
                    SizedBox(width: 10,),
                    Text("639690001111", style:ts0)

                  ],

                ),
                Row(

                  children: [
                    Icon(Icons.card_travel,color:Colors.grey),
                    SizedBox(width: 10,),
                    Text("0122222121200878", style:ts0)

                  ],

                )


              ],

            ),
          )
      ),
    );
  }
}




