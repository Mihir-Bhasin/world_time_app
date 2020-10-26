import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';


class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),

  ];

void updateTime(index) async{
  WorldTime instance = locations[index];
  await instance.Gettime();
  //nav tothe new location.
  Navigator.pop(context,{
    'location' :instance.location,
    'flag' : instance.flag,
    'time' : instance.time,
    'isDaytime' : instance.isDaytime,
  });


}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Choose Your Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(

        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 4.0 ),

           child: Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/${locations[index].flag}'),
              ),
            ),
          )
          );


        }
      ),
    );
  }
}
