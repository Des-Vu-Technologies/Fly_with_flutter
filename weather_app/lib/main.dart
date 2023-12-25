import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/weather_model.dart';
import 'services/http_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HttpService httpServices;
  late Main chahiyakoData;
  late List<Weather> weatherStatus;

  void getWeatherData() async {
    Response response = await httpServices.getRequest("/weather");

    WeatherModel weatherdata = WeatherModel.fromJson(response.data);

    chahiyakoData = weatherdata.main!;
    weatherStatus = weatherdata.weather!;

    setState(() {});
  }

  @override
  void initState() {
    httpServices = HttpService();
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 236, 236),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 236, 236),
        leading: const Text("Cancel"),
        actions: const [Text("")],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("sun 23 april 11 2023"),
                        Text(
                          "${chahiyakoData.temp} °C",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(weatherStatus.first.main!),
                        Text("feels like ${chahiyakoData.feelsLike}°C"),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.network(
                        'http://openweathermap.org/img/wn/${weatherStatus.first.icon}@4x.png',
                        scale: 0.5,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
