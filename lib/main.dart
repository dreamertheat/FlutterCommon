import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'models/Locationee.dart';

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



class Karudo extends StatelessWidget {
  
  final Locationee loc;
  final Function delete;

  Karudo(this.loc,this.delete);

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


List<Locationee> locations = [
  Locationee(1,"Manila","34,2","12-01-09"),
  Locationee(2,"Marikina","67,66","09-01-09"),
  Locationee(3,"Makati","98,24","08-01-09"),
  Locationee(4,"Taguig","110,333","07-01-09"),
  Locationee(5,"San Mateo","210,233","06-01-09"),

];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CircleAvatar(backgroundImage: NetworkImage('https://i.imgur.com/kGjXf.jpg'), radius: 50, backgroundColor: Colors.blue,)),
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
            Center(
              child: Column(children:
                    locations.map((e) => Karudo(e,(){ callToast(e.name,context); setState(() {
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

        )
      ),
    );
  }
}


void callToast(String message, BuildContext bc){
  Toast.show("${message}", bc, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}

TextStyle ts0 = TextStyle(color: Colors.grey, letterSpacing: 1.0);
TextStyle ts1 = TextStyle(color: Colors.amber);
TextStyle ts2 = TextStyle(color: Colors.amber, letterSpacing: 2.0);
TextStyle ts3 = TextStyle(color: Colors.grey, letterSpacing: 2.0, fontSize: 28, fontWeight: FontWeight.bold);
TextStyle tsList = TextStyle(color: Colors.white, letterSpacing: 2.0, fontSize: 16, fontWeight: FontWeight.bold);

TextStyle warning = TextStyle(color: Colors.red, letterSpacing: 2.0, fontSize: 28, fontWeight: FontWeight.bold);



