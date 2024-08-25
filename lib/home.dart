import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'worker/worker.dart';
import 'worker/Worker2.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? temperature = '25',
      humidity = '50',
      city = 'loading',
      country = 'loading',
      description = 'loading',
      wind = '3.0',
      icon = 'icon',
      temperaturee1 = '25',
      temperaturee2 = '25',
      datefirst = 'date',
      datesecond = 'date',
      location;
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

  List dates = [], temps = [], hums = [], winds = [], icons = [];
  Future<void> start2(String location) async {
    Workerr instance = Workerr(location: location);
    await instance.getdailydata();
    temperaturee1 = instance.temperature1;
    temperaturee2 = instance.temperature2;
    dates = [instance.date1, instance.date2, instance.date3, instance.date4];
    winds = [instance.wind1, instance.wind2, instance.wind3, instance.wind4];
    hums = [
      instance.humidity1,
      instance.humidity2,
      instance.humidity3,
      instance.humidity4
    ];
    temps = [
      instance.temperature1,
      instance.temperature2,
      instance.temperature3,
      instance.temperature4
    ];
    icons = [
      instance.icon1,
      instance.icon2,
      instance.icon3,
      instance.icon4,
    ];
  }

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('yMMMMd').format(DateTime.now());

    Map<dynamic, dynamic>? info =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?;
    var loc = info?['loc_var'] ?? "Sheikhpura";
    if (loc?.isNotEmpty ?? true) {
      location = loc;
    }
    start("$location");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white12, Colors.brown, Colors.grey],
                stops: [0.0, 0.7, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              children: [
                FutureBuilder(
                  future: start("$location"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: [
                            Container(
                              height: 40,
                              width: 500,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade300.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              margin: const EdgeInsets.only(
                                  top: 10, left: 20, right: 17),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/location');
                                },
                                child: Container(
                                  child: const Text(
                                    'Click to Search Your City',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Font",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 20, right: 17),
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade300.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Image.network(
                                                'https://openweathermap.org/img/wn/$icon@2x.png',
                                                scale: 1),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 15),
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
                                      color: Colors.brown.shade300
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 50,
                                              top: 10,
                                              left: 5,
                                              right: 3),
                                          child: const Icon(
                                              WeatherIcons.thermometer),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15),
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
                                          margin: const EdgeInsets.only(
                                              left: 9, top: 10),
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
                                      color: Colors.brown.shade300
                                          .withOpacity(0.4),
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
                                          child: const Icon(
                                              WeatherIcons.cloudy_windy),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 25),
                                                child: Text(
                                                  '$wind',
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Container(
                                                child: const Text(
                                                  'Km/hr',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                      color: Colors.brown.shade300
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 50, top: 10, left: 5),
                                          child:
                                              const Icon(WeatherIcons.humidity),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 25),
                                                child: Text(
                                                  '$humidity',
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Container(
                                                child: const Text(
                                                  'percent',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  },
                ),
                FutureBuilder(
                  future: start2("$location"),
                  builder: (context, snapshot) {
                    return Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 20, right: 17),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade300.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ExpansionTile(
                        title: const Text('Detailed Noon Weather',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        children: [
                          SingleChildScrollView(
                            child: Container(
                              height: 400,
                              child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.all(5),
                                    height: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.brown.shade300
                                          .withOpacity(0.8),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Image.network(
                                                    'https://openweathermap.org/img/wn/${icons[index]}@2x.png'),
                                              ),
                                              Container(
                                                child: Text(
                                                  "${dates[index]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 15,
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 3),
                                                    child: const Icon(
                                                        WeatherIcons
                                                            .thermometer),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "${temps[index]}",
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: const Text(
                                                      'o',
                                                      style: TextStyle(
                                                          fontSize: 1,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 9),
                                                    child: const Text(
                                                      'C',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: const Icon(
                                                        WeatherIcons
                                                            .cloudy_windy),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "${winds[index]}",
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 6),
                                                    child: const Text(
                                                      'Km/h',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 2),
                                                    child: const Icon(
                                                        WeatherIcons.humidity),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    child: Text(
                                                      "${hums[index]}",
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: const Text(
                                                      '%',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  height: 220,
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Credits: OpenWeatherMap',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fonts',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
