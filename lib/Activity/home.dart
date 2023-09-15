import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController= new TextEditingController();
  void timer() {
    //process - 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      print("Alarm");
    });
    print("shbdhb");
  }

  int counter = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer();
    print("This is a init state");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Destroyed");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set State called");
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> info =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var city_name = [
      "Mumbai",
      "Tumkur",
      "Delhi",
      "Patna",
      "Bangalore",
      "Srinagar",
      "Kolkata"
    ];
    String tem=(info["temp_value"].toString());
    String hum=info["hum_value"].toString();
    String air = ((info['air_speed_value']).toString());
    String icon=info['icon_value'];
    if(tem=="NA")
    {
      print("NA");
    }
    else
    {
      tem=(info["temp_value"].toString()).substring(0,4);
      air = ((info['air_speed_value']).toString()).substring(0,4);
    }
    String cityy=info['city_value'].toString();
    String des=info['des_value'].toString().toUpperCase();
    String main=info['main_value'].toString();
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color.fromRGBO(1, 27, 49, 1),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(1, 27, 49, 1),
                      Color.fromRGBO(1, 63, 85, 1),
                      Color.fromRGBO(1, 127, 95, 1),
                    ])),
            child: Column(
              children: [
                Container(
                  //search container

                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "")=="")
                          {
                            print("Blank Search");
                          }else {
                            Navigator.pushReplacementNamed(context, "/loading", arguments: {
                              "searchText": searchController.text,

                            });
                          }
                        },
                        child: Container(
                          child: Icon(Icons.search),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Search $city"),
                          )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.258),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(28),
                        child: Row(
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("$des",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text("in $cityy",style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.258),
                        ),
                        margin:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                        padding: EdgeInsets.all(28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer,color: Colors.white,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$tem",style: TextStyle(fontSize: 70,color: Colors.white,),),
                                Text("C",style: TextStyle(fontSize: 20,color: Colors.white,),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.258),
                        ),
                        margin: EdgeInsets.fromLTRB(25, 0, 10, 0),
                        padding: EdgeInsets.all(28),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy,color: Colors.white,),
                              ],
                            ),SizedBox(height: 20,),
                            Text("$air",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("Km/hr",style: TextStyle(color: Colors.white,),),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.258),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 25, 0),
                        padding: EdgeInsets.all(28),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity,color: Colors.white,),
                              ],
                            ),SizedBox(height: 20,),
                            Text("$hum",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("Percent",style: TextStyle(color: Colors.white,),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 58),
                Text(
                  "Made By Aadarsh",
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
