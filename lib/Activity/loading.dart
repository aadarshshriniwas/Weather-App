import 'package:flutter/material.dart';
import 'package:weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum;
  late String airspeed;
  late String des;
  late String main;
  late String icon;
  String city="Patna";
  void startApp(String city) async
  {
    worker instance=worker(location:"$city");
    await instance.getData();
    temp=instance.temp;
    hum=instance.humidity;
    airspeed=instance.air_speed;
    des=instance.description;
    main=instance.main;
    icon=instance.icon;
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,'/home',arguments: {
        "temp_value":temp,
        "hum_value":hum,
        "air_speed_value":airspeed,
        "des_value":des,
        "main_value":main,
        "icon_value":icon,
        "city_value":city,
      });

    });

  }
  @override
  void initState(){


    super.initState();
  }
  Widget build(BuildContext context) {
    Map<String, dynamic>? search =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (search != null && search.isNotEmpty) {
      city = search['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180),
              Image.asset("assets/rainy.png",height: 200,width: 200,),
              SizedBox(height: 20,),
              Text("Mausam Dekho",style: TextStyle(fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Text("Made by Aadarsh",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500),),
              SizedBox(height: 40,),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),

            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
