import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  String location;

  Worker({
    required this.location,
  });
  String? temp;
  String? humidity;
  String? wind;
  String? description;
  String? city;
  String? country;
  String? icon;

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=041589cc186b172035c2b8961673b63b'));
      Map data = jsonDecode(response.body);
      double tempp = data['main']['temp'] - 273.15;
      String gettemp = tempp.toStringAsFixed(0);
      String gethumidity = data['main']['humidity'].toString();
      String getwind = data['wind']['speed'].toStringAsFixed(1);
      String getdescription = data['weather'][0]['description'].toString();
      String geticon = data['weather'][0]['icon'].toString();
      String getcity = data['name'].toString();
      String getcountry = data['sys']['country'].toString();
      temp = gettemp;
      humidity = gethumidity;
      wind = getwind;
      description = getdescription;
      city = getcity;
      country = getcountry;
      icon = geticon;
    } catch (e) {
      temp = '0';
      humidity = '0';
      wind = '0.0';
      description = 'Seems Wrong City!';
      location = 'Search Bar';
      icon = '01d';
    }
  }
}
