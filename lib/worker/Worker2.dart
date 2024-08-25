import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Workerr {
  String? temperature1, temperature2, temperature3, temperature4;
  String? date1, date2, date3, date4;
  String? humidity1, humidity2, humidity3, humidity4;
  String? wind1, wind2, wind3, wind4;
  String? icon1, icon2, icon3, icon4;
  String location;

  Workerr({required this.location});
  Future<void> getdailydata() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=041589cc186b172035c2b8961673b63b'));
      Map data = jsonDecode(response.body);
      double temp1 = data['list'][4]['main']['temp'] - 273.15;
      double temp2 = data['list'][12]['main']['temp'] - 273.15;
      double temp3 = data['list'][20]['main']['temp'] - 273.15;
      double temp4 = data['list'][28]['main']['temp'] - 273.15;
      String datee1 = data['list'][4]['dt_txt'].toString();
      String datee2 = data['list'][12]['dt_txt'].toString();
      String datee3 = data['list'][20]['dt_txt'].toString();
      String datee4 = data['list'][28]['dt_txt'].toString();
      double hum1 = data['list'][4]['main']['humidity'];
      double hum2 = data['list'][12]['main']['humidity'];
      double hum3 = data['list'][20]['main']['humidity'];
      double hum4 = data['list'][28]['main']['humidity'];
      double win1 = data['list'][4]['wind']['speed'];
      double win2 = data['list'][12]['wind']['speed'];
      double win3 = data['list'][20]['wind']['speed'];
      double win4 = data['list'][28]['wind']['speed'];
      String dateee1 = DateFormat("yMMMEd").format(DateTime.parse(datee1));
      String dateee2 = DateFormat("yMMMEd").format(DateTime.parse(datee2));
      String dateee3 = DateFormat("yMMMEd").format(DateTime.parse(datee3));
      String dateee4 = DateFormat("yMMMEd").format(DateTime.parse(datee4));
      String icn1 = data['list'][4]['weather'][0]['icon'].toString();
      String icn2 = data['list'][12]['weather'][0]['icon'].toString();
      String icn3 = data['list'][12]['weather'][0]['icon'].toString();
      String icn4 = data['list'][12]['weather'][0]['icon'].toString();
      temperature1 = temp1.toStringAsFixed(0);
      temperature2 = temp2.toStringAsFixed(0);
      temperature3 = temp3.toStringAsFixed(0);
      temperature4 = temp4.toStringAsFixed(0);
      date1 = dateee1;
      date2 = dateee2;
      date3 = dateee3;
      date4 = dateee4;
      humidity1 = hum1.toStringAsFixed(0);
      humidity2 = hum2.toStringAsFixed(0);
      humidity3 = hum3.toStringAsFixed(0);
      humidity4 = hum4.toStringAsFixed(0);
      wind1 = win1.toStringAsFixed(1);
      wind2 = win2.toStringAsFixed(1);
      wind3 = win3.toStringAsFixed(1);
      wind4 = win4.toStringAsFixed(1);
      icon1 = icn1;
      icon2 = icn2;
      icon3 = icn3;
      icon4 = icn4;
    } catch (e) {
      throw ('Error!');
    }
  }
}
