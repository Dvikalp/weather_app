import 'dart:convert';
import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart';

class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location)async{
    Response response =await get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&APPID=8af4916b14d18caab55119e47a7fb12e&units=metric"));
    Map data=jsonDecode(response.body);
    print("Printing data $data");
    return Weather.fromJson(data);
  }
}