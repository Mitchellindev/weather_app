import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'additional_info_widget.dart';
import 'hourly_card_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  Future getCurrentWeather() async {
    http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=bb96fd83fc8761373b41e3276aa52085'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        actions: const [
          InkWell(
            child: Icon(
              Icons.refresh,
              size: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            '300 k',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Icon(
                            Icons.cloud,
                            size: 32,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Rain',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyCard(
                      time: '00:00', temperature: '330.77', icon: Icons.cloud),
                  HourlyCard(
                      time: '03:00', temperature: '302.62', icon: Icons.cloud),
                  HourlyCard(
                      time: '06:00', temperature: '300.77', icon: Icons.cloud),
                  HourlyCard(
                      time: '09:00', temperature: '312.09', icon: Icons.cloud),
                  HourlyCard(
                      time: '06:00', temperature: '300.00', icon: Icons.cloud),
                  HourlyCard(
                      time: '06:00', temperature: '300.00', icon: Icons.cloud),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(
                    title: 'Humidity', value: '94', icon: Icons.water_drop),
                AdditionalInfo(
                    title: 'Wind Speed', value: '7.77', icon: Icons.air),
                AdditionalInfo(
                    title: 'Pressure', value: '1000', icon: Icons.beach_access),
              ],
            )
          ],
        ),
      ),
    );
  }
}
