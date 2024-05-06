import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hava_durumu_app/search_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = 'Ankara';
  double temperature = 20.0;
  final String anahtar = '494fe3131500c2575b4a29bd0bf64241';
  var LocationData;

  Future<void> getLocationData() async {
    LocationData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$anahtar'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/c.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    print(LocationData);
                    await getLocationData();
                    debugPrint('getlocation çağrıldıktan sonra$LocationData');
                    final locationDataParsed = jsonDecode(LocationData.body);
                    // Future.delayed(
                    // Duration(seconds: 3), (() => (print(LocationData))));
                    print(locationDataParsed);
                    print(locationDataParsed.runtimeType);
                    print(locationDataParsed['main']['temp']);
                  },
                  child: Text('getLocationData')),
              Text(
                '$temperature° C',
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    location,
                    style: TextStyle(fontSize: 30),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchPage()));
                      },
                      icon: Icon(Icons.search))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
