import 'package:flutter/material.dart';
import 'package:scube/core/constants/app_assets.dart';
import 'package:scube/features/dashboard/presentation/widgets/thermometer_widget.dart';
import 'dart:async';

class EnvironmentCard extends StatefulWidget {
  const EnvironmentCard({super.key});

  @override
  State<EnvironmentCard> createState() => _EnvironmentCardState();
}

class _EnvironmentCardState extends State<EnvironmentCard> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic Logic based on time (Simulating the screenshot scenarios)
    // 11:00 AM - 12:00 PM -> 17°C, Blue, CloudSun
    // 12:00 PM - 01:00 PM -> 30°C, Red, Sun
    // 02:30 PM - 03:30 PM -> 19°C, Teal, Moon (Simulated for evening/night)

    final double timeInHours = _currentTime.hour + _currentTime.minute / 60.0;

    String tempText;
    double temperature;
    Color tempColor;
    String weatherIcon;

    if (timeInHours >= 11.0 && timeInHours < 12.0) {
      // 11:00 AM - 12:00 PM: 17°C, Blue, CloudSun
      tempText = '17°C';
      temperature = 17;
      tempColor = const Color(0xFF0099FF);
      weatherIcon = AppAssets.cloudSun;
    } else if (timeInHours >= 12.0 && timeInHours < 13.0) {
      // 12:00 PM - 01:00 PM: 30°C, Red, Sun
      tempText = '30°C';
      temperature = 30;
      tempColor = Colors.red;
      weatherIcon = AppAssets.sun;
    } else if (timeInHours >= 14.5 && timeInHours < 15.5) {
      // 02:30 PM - 03:30 PM: 19°C, Teal, Moon
      tempText = '19°C';
      temperature = 19;
      tempColor = Colors.teal;
      weatherIcon = AppAssets.moon;
    } else {
      // Default / Fallback (Outside specified ranges)
      // Defaulting to Morning state or keeping last known state could be options.
      // For now, let's default to Morning state to ensure valid values are always present.
      tempText = '17°C';
      temperature = 17;
      tempColor = const Color(0xFF0099FF);
      weatherIcon = AppAssets.cloudSun;
    }

    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Side (White)
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tempText,
                          style: TextStyle(
                            color: tempColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Module\nTemperature',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 10,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ThermometerWidget(
                    temperature: temperature,
                    color: tempColor,
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          // Right Side (Gradient)
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7B61FF), Color(0xFFC084FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '26 MPH / NW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Wind Speed & Direction',
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                        const SizedBox(height: 2),
                        const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '15.20 w/m²',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Effective Irradiation',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(weatherIcon, height: 50, width: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
