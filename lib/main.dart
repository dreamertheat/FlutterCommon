import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(

    home: GG(),

  ));
}


class GG extends StatefulWidget {
  @override
  _GGState createState() => _GGState();
}


double manipulator(double num){
  return num + (Random().nextInt(10));
}

class _GGState extends State<GG> {

  double count = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Container(child: Image.network('https://i.imgur.com/kGjXf.jpg')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ setState(() {
          count = manipulator(count);
        });},
        child: Icon(Icons.ac_unit),
      ),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        title: Text("OWNAGE",style: ts1),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CircleAvatar(backgroundImage: NetworkImage('https://i.imgur.com/kGjXf.jpg'), radius: 50, backgroundColor: Colors.blue,)),
            Divider(height: 60, color: Colors.grey[100]),
            Text('NAME',style: ts2),
              SizedBox(height: 10,),
            Text("RACOONER",style: ts3),
              SizedBox(height: 30,),
            Text('STATUS',style: ts2),
              SizedBox(height: 10,),
            Text('MISSING',style: warning),
              SizedBox(height: 10,),
            Text('KILLS',style: ts2),
              SizedBox(height: 10,),
            Text('$count',style: warning),
            SizedBox(height: 30,),

            Row(

              children: [
                Icon(Icons.email,color:Colors.grey),
                SizedBox(width: 10,),
                Text("Owning@ownage.com", style:ts0)

              ],

            )


          ],

        )
      ),
    );
  }
}
TextStyle ts0 = TextStyle(color: Colors.grey, letterSpacing: 1.0);
TextStyle ts1 = TextStyle(color: Colors.amber);
TextStyle ts2 = TextStyle(color: Colors.amber, letterSpacing: 2.0);
TextStyle ts3 = TextStyle(color: Colors.grey, letterSpacing: 2.0, fontSize: 28, fontWeight: FontWeight.bold);
TextStyle warning = TextStyle(color: Colors.red, letterSpacing: 2.0, fontSize: 28, fontWeight: FontWeight.bold);



