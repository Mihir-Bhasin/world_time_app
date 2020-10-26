import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override
  Widget build(BuildContext context) {
   data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
   print(data);
   // set bg
   String bgimage = data['isDaytime'] ? 'sunny.jpg' : 'night.jpg';
   Color bgColor = data['isDaytime'] ? Colors.blue[300]: Colors.indigo[700];




    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/$bgimage'),
              fit: BoxFit.cover,

            )
          ),
          padding: const EdgeInsets.fromLTRB(0, 122,0,0),
          child: SafeArea(child: Column(
            children: <Widget>[

              FlatButton.icon(onPressed: () async{
               dynamic result= await Navigator.pushNamed(context, '/location');
               setState(() {
                 data= {

                'time': result['time'],
                   'location': result['location'],
                   'isDaytime': result['isDaytime'],
                   'flag': result['flag']
                 };
               });

              },
                icon: Icon(
                    Icons.edit_location),


                label: Text('Edit Location',
                  style: TextStyle(

                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,


                  ),

                ),


              ),
              SizedBox(height: 120.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.black

                    ),

                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.black,
                ),
              ),


            ],
          )),
        ),
      ),
    );
  }
}
