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

  void getWeatherData() async {
    Response response = await httpServices.getRequest();

    WeatherModel weatherdata = WeatherModel.fromJson(response.data);

    chahiyakoData = weatherdata.main!;

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
      appBar: AppBar(
        leading: const Text("Cancel"),
        actions: const [Text("")],
      ),
      body: Column(children: [
        Container(
          height: 200,
          color: Colors.white,
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: [
                  const Text("sun 23 april 11 2023"),
                  Text(
                    "${chahiyakoData.temp} °C",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Text("clear"),
                  const Text("feels like 23 degree C")
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
