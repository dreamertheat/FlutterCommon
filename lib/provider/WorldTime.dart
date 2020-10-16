

import 'dart:convert';

import 'package:http/http.dart';

class WorldTime{


  String continent;
  String capital;
  String display;
  WorldTime(this.continent, this.capital);


  Future<Map> getTime() async{

      Response res = await get("http://worldtimeapi.org/api/timezone/${continent}/${capital}");
      print(res.body);
      Map map = jsonDecode(res.body);

      return map;
  }


}