import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {



  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
   await instance.Gettime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location' :instance.location,
     'flag' : instance.flag,
    'time' : instance.time,
     'isDaytime' : instance.isDaytime,
   });


  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.orange[400],

        body: Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 80.0,
          ),

        ),
      );
    }
}
