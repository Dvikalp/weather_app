import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_api_client.dart';
import 'package:weather_app/model/weather_model.dart';

import 'model/search_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage("Chandigarh,India"),
    );
  }
}

class HomePage extends StatefulWidget {

  String ? city;
  HomePage(this.city);

  @override
  State<HomePage> createState() => _HomePageState(city);
}

class _HomePageState extends State<HomePage> {

  WeatherApiClient client=WeatherApiClient();
  Weather ?data;
  String? city;
  _HomePageState(this.city);


  Future<void> getData()async{
    if(city==null){
      data=await client.getCurrentWeather("Chandigarh");
    }
    else{
      data=await client.getCurrentWeather("$city");
    }
  }

  @override
  void initState() {
    getData();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        title: Text("Weather App",style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
          color: Colors.black87,
        ),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearch(hintText: 'City'));
          }, icon: Icon(Icons.search),color: Colors.black87,)
        ],
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                      children: [
                        Icon(
                          Icons.wb_sunny_rounded,
                          color: Colors.orange,
                          size: 75,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "${data!.temp}°C",
                          style: TextStyle(fontSize: 40, color: Colors.black87),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "${data!.cityName}",
                          style: TextStyle(fontSize: 25, color: Colors.black45),
                        ),
                        SizedBox(height: 30,),
                        Text(
                          "Additional Information",
                          style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Divider(),
                        SizedBox(height: 35,),
                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pressure",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      //SizedBox(width: 30,),
                      Text(
                        "${data!.pressure}hPa",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      //SizedBox(width: 60,),
                      Text(
                        "Wind",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      //SizedBox(width: 20,),
                      Text(
                        "${data!.wind}m/s",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Humidity",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      //SizedBox(width: 30,),
                      Text(
                        "${data!.humidity}%",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      //SizedBox(width: 60,),
                      Text(
                        "Feels",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      //SizedBox(width: 20,),
                      Text(
                        "${data!.feels_like}°C",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Min Temp",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      //SizedBox(width: 30,),
                      Text(
                        "${data!.tempMin}°C",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      //SizedBox(width: 60,),
                      Text(
                        "Max Temp",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      //SizedBox(width: 20,),
                      Text(
                        "${data!.tempMax}°C",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      )
                    ],
                  ),
                ),

              ],
            );
          }),
    );
  }
}


