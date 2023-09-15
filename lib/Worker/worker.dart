import 'dart:convert';
import 'package:http/http.dart';

class worker {
  String location;

  worker({required this.location}) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;
  Future<void> getData() async
  {
    try {
      Response response = await get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&appid=3ee3a0f17a1c9edcc896674ad3593dea"));
      Map data = jsonDecode(response.body);


      //Temp,humidity
      Map temp_data = data['main'];
      Map wind = data['wind'];
      double getTemp = temp_data['temp']-273.15;
      String getHumidity = temp_data['humidity'].toString();

      //air map
      double getAir_speed = wind['speed']/0.27777777777778;


      //Getting descroption
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      //Assigning values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
      icon=weather_main_data['icon'].toString();

    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "City not found!";
      main = "NA";
      icon="03n";
    }
  }
}