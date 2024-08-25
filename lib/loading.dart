import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/location');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              Container(
                height: 100,
              ),
              CircleAvatar(
                radius: 75,
                child: Image.asset('assets/images/1.PNG'),
              ),
              const Text(
                '  Hritu',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'Fontss',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 100,
                child: Text(
                  '                              - by Vinay Kumar',
                  style: const TextStyle(
                    fontFamily: 'Fonts',
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: const SpinKitWave(
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
