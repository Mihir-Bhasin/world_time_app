import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location displayed
  String time; // time of the location shown
  String flag; //url to asset flag icon
  String url; //location  url for api endpoint
  bool isDaytime; // states true or false if its day or not

  WorldTime({this.location, this.flag, this.url});


 Future <void> Gettime() async {

    try{
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      //get property from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      // print(offset);
// create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //set the time property
      isDaytime = now.hour > 6 && now.hour < 20? true : false;
      time = DateFormat.jm().format(now);

    }
    catch(e) {

      time="could not get time data";

    }

  }
}

