import 'package:flutter/material.dart';
import 'package:helloworld/home.dart';
import 'package:helloworld/loading.dart';
import 'package:helloworld/location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Loading(),
    routes: {
      "/home": (context) => const Home(),
      "/location": (context) => const Location(),
    },
  ));
}
