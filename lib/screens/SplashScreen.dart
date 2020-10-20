
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/design/Design.dart';
import 'package:flutter_app/provider/WorldTime.dart';
import 'package:flutter_app/utilities/CommonTools.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class SplashScreen extends StatefulWidget {

  

  @override
  State createState() {

    return _LoadingState();
  }
}



class _LoadingState extends State<SplashScreen> {

  String data="loading data....";
  List<WorldTime> Times = [
    WorldTime("asia", "manila"),
    WorldTime("asia", "jakarta"),
    WorldTime("asia", "tokyo"),
    WorldTime("europe", "madrid"),
    WorldTime("europe", "london"),
    WorldTime("europe", "stockholm"),
    WorldTime("europe", "berlin"),
    WorldTime("europe", "oslo"),
    WorldTime("europe", "athens"),
    WorldTime("asia", "shanghai"),
    WorldTime("asia", "seoul"),
    WorldTime("asia", "pyongyang"),
    WorldTime("asia", "brunei"),
    WorldTime("asia", "bangkok"),
  ];

  WorldTime f = null;

  _LoadingState(){

      /*WorldTime("asia", "manila").getTime().then((value) =>  setState(() {
        String offset = value["utc_offset"].substring(1,3);
        DateTime date = DateTime.parse(value["datetime"]);
        date.add(Duration(hours: int.parse(offset)));
        data = DateFormat.jm().format(date);
      }));*/





  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Select country", style: ts1), backgroundColor: Colors.black87,centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return FutureBuilder<Map>(
            future: Times[index].getTime(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Card(
                  child: ListTile(
                    onTap: (){
                      callToast(converter("${snapshot.data["raw_offset"]}","${snapshot.data["unixtime"]}"),context);

                      /*Navigator.pushNamed(context,"/loading",arguments: {
                        "datetime":"${snapshot.data['datetime']}",
                        "utc_offset":"${snapshot.data['utc_offset']}"
                      }
                        );*/
                    },
                    title:  Text("${snapshot.data["timezone"]}"),
                  ),
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },

          );
        },
        itemCount: Times.length,
      )
    );
  }
}


String converter(String utc, String dt){
  final df = new DateFormat('dd-MM-yyyy hh:mm a');
  int myvalue = int.parse(dt);
  int offset = int.parse(utc);
  return df.format(new DateTime.fromMillisecondsSinceEpoch((myvalue+offset)*1000));
}

/*FutureBuilder<Map>(
future: Times[index].getTime(),
builder: (context, snapshot) {
if (snapshot.hasData) {
return Text("${snapshot.data["timezone"]}");
} else {
return Center(
child: CircularProgressIndicator(),
);
}
},
)*/

Widget create(WorldTime wt){

  String txt = "loading";
  wt.getTime().then((value) {
    String offset = value["utc_offset"].substring(1,3);
    DateTime date = DateTime.parse(value["datetime"]);
    date.add(Duration(hours: int.parse(offset)));
    txt = DateFormat.jm().format(date);
  });



  return Text(txt);
}