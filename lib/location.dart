import 'package:flutter/material.dart';
import 'package:helloworld/worker/worker.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:weather_icons/weather_icons.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController searchController = TextEditingController();
  String? temperature = '25',
      humidity = '50',
      city = 'loading',
      country = 'loading',
      description = 'loading',
      wind = '3.0',
      icon = 'icon',
      location = 'Sheikhpura';
  Future<void> start(String location) async {
    Worker instance = Worker(location: location);
    await instance.getData();
    temperature = instance.temp;
    humidity = instance.humidity;
    city = instance.city;
    country = instance.country;
    description = instance.description;
    wind = instance.wind;
    icon = instance.icon;
  }

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('yMMMMd').format(DateTime.now());
    var cities = [
      "Patna",
      "Mumbai",
      "Lucknow",
      "Kolkata",
      "Guwahati",
      "Delhi",
      "Hyderabad",
      "Chennai",
      "Bengaluru",
      "Srinagar",
      "Prayagraj",
      "Ahmedabad"
    ];
    final _random = Random();
    var citi = cities[_random.nextInt(cities.length)];
    // location = "Sheikhpura";
    // start("$location");
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white12, Colors.brown, Colors.grey],
              stops: [0.0, 0.7, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
          ),
          child: FutureBuilder(
            future: start("$location"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffb1a8a4),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                margin: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        var pass_loc;
                                        pass_loc = searchController.text;
                                        Navigator.pushNamed(context, '/home',
                                            arguments: {"loc_var": pass_loc});
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.all(10),
                                          child: const Icon(Icons.search)),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: searchController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search $citi",
                                          hintStyle: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 17),
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade300.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Image.network(
                                        'https://openweathermap.org/img/wn/$icon@2x.png',
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        '$date',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Text(
                                  '$description',
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'in $location',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 20, right: 5),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade300.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 50, top: 10, left: 5, right: 3),
                                    child: const Icon(WeatherIcons.thermometer),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      '$temperature',
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      'o',
                                      style: TextStyle(
                                          fontSize: 1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 9, top: 10),
                                    child: const Text(
                                      'C',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 5, right: 5),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade300.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 50,
                                        top: 10,
                                        left: 10,
                                        right: 3),
                                    child:
                                        const Icon(WeatherIcons.cloudy_windy),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 25),
                                          child: Text(
                                            '$wind',
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          child: const Text(
                                            'Km/hr',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 5, right: 20),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade300.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 50, top: 10, left: 5),
                                    child: const Icon(WeatherIcons.humidity),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 25),
                                          child: Text(
                                            '$humidity',
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          child: const Text(
                                            'percent',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
