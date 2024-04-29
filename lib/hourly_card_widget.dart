import 'package:flutter/material.dart';

class HourlyCard extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyCard({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 8,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          width: 100,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                time,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 5.0),
              Icon(icon),
              const SizedBox(height: 5.0),
              Text(temperature)
            ],
          ),
        ),
      ),
    );
  }
}
