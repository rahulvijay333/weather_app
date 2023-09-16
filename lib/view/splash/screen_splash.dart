import 'package:flutter/material.dart';
import 'package:weather_app/view/home/screen_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return Screenhome();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WeatherWave',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
