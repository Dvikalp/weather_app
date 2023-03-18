class Weather{
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  double? feels_like;
  double? tempMin;
  double? tempMax;


  Weather({
    String? cityName,
    double? temp,
    double? wind,
    int? humidity,
    int? pressure,
    double? feels_like,
    double? tempMin,
    double? tempMax,
});
  Weather.fromJson(Map json){
    cityName=json["name"];
    temp=json["main"]["temp"];
    wind=json["wind"]["speed"];
    pressure=json["main"]["pressure"];
    humidity=json["main"]["humidity"];
    feels_like=json["main"]["feels_like"];
    tempMin=json["main"]["temp_min"];
    tempMax=json["main"]["temp_max"];
  }
}