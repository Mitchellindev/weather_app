import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const AdditionalInfo(
      {super.key,
      require,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32.0,
        ),
        const SizedBox(height: 5.0),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5.0),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
