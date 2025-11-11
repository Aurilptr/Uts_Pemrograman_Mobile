// lib/fragments/cuaca_fragment.dart

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; 

class CuacaFragment extends StatelessWidget {
  CuacaFragment({super.key});

  // --- DATA STATIS UNTUK PREDIKSI 24 JAM ---
  final List<Map<String, dynamic>> hourlyForecast = [
    {'time': '12:00', 'icon': Icons.wb_sunny_rounded, 'temp': '30°'},
    {'time': '13:00', 'icon': Icons.wb_sunny_rounded, 'temp': '31°'},
    {'time': '14:00', 'icon': Icons.cloud_outlined, 'temp': '30°'},
    {'time': '15:00', 'icon': Icons.cloud_rounded, 'temp': '29°'},
    {'time': '16:00', 'icon': Icons.cloud_outlined, 'temp': '28°'},
    {'time': '17:00', 'icon': Icons.wb_twilight_rounded, 'temp': '27°'},
    {'time': '18:00', 'icon': Icons.nightlight_round, 'temp': '25°'},
    {'time': '19:00', 'icon': Icons.nightlight_round, 'temp': '24°'},
    {'time': '20:00', 'icon': Icons.nightlight_round, 'temp': '24°'},
    {'time': '21:00', 'icon': Icons.nightlight_round, 'temp': '23°'},
    {'time': '22:00', 'icon': Icons.nightlight_round, 'temp': '23°'},
    {'time': '23:00', 'icon': Icons.nightlight_round, 'temp': '22°'},
    {'time': '00:00', 'icon': Icons.nightlight_round, 'temp': '22°'},
    {'time': '01:00', 'icon': Icons.nightlight_round, 'temp': '21°'},
    {'time': '02:00', 'icon': Icons.nightlight_round, 'temp': '21°'},
    {'time': '03:00', 'icon': Icons.nightlight_round, 'temp': '20°'},
    {'time': '04:00', 'icon': Icons.wb_twilight_rounded, 'temp': '20°'},
    {'time': '05:00', 'icon': Icons.wb_twilight_rounded, 'temp': '21°'},
    {'time': '06:00', 'icon': Icons.wb_sunny_rounded, 'temp': '22°'},
    {'time': '07:00', 'icon': Icons.wb_sunny_rounded, 'temp': '24°'},
    {'time': '08:00', 'icon': Icons.wb_sunny_rounded, 'temp': '26°'},
    {'time': '09:00', 'icon': Icons.wb_sunny_rounded, 'temp': '27°'},
    {'time': '10:00', 'icon': Icons.cloud_outlined, 'temp': '28°'},
    {'time': '11:00', 'icon': Icons.wb_sunny_rounded, 'temp': '29°'},
  ];

  // --- DATA STATIS UNTUK INFO TAMBAHAN ---
  final List<Map<String, dynamic>> additionalInfo = [
    {'icon': Icons.water_drop_outlined, 'title': 'Kelembapan', 'value': '65%'},
    {'icon': Icons.air, 'title': 'Angin', 'value': '10 km/j'},
    {'icon': Icons.wb_sunny_outlined, 'title': 'Indeks UV', 'value': 'Tinggi'},
    {'icon': Icons.thermostat_outlined, 'title': 'Terasa Seperti', 'value': '30°C'},
  ];


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // --- Widget Cuaca Saat Ini ---
        _buildCurrentWeather(),
        
        const SizedBox(height: 24),

        // --- Widget Prediksi Per Jam (Horizontal Scroll) ---
        _buildHourlyForecast(),

        const SizedBox(height: 24),

        // --- Widget Info Tambahan (Grid 2x2) ---
        _buildAdditionalInfo(),
      ],
    );
  }

  // --- WIDGET HELPER ---

  // Widget untuk info cuaca saat ini (Lokasi, Lottie, Suhu)
  Widget _buildCurrentWeather() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Bandung, Indonesia",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Jumat, 24 Oktober 2025",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 20),

        Lottie.asset(
          'assets/animations/partly_sunny.json',
          width: 200,
          height: 200,
        ),
        
        const SizedBox(height: 10),

        const Text(
          "28°C",
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE91E63),
          ),
        ),
        const Text(
          "Cerah Berawan",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Widget untuk Prediksi Per Jam (Horizontal Scroll)
  Widget _buildHourlyForecast() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Prediksi 24 Jam",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 120, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hourlyForecast.length,
                itemBuilder: (context, index) {
                  final forecast = hourlyForecast[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          forecast['time'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Icon(
                          forecast['icon'],
                          color: const Color(0xFFF48FB1), 
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          forecast['temp'],
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Info Tambahan (Grid 2x2)
  Widget _buildAdditionalInfo() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Detail Cuaca", 
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63), 
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(), 
              itemCount: additionalInfo.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5, 
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ), 
              itemBuilder: (context, index) {
                final info = additionalInfo[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      info['icon'],
                      color: const Color(0xFFF48FB1), 
                      size: 30,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          info['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          info['value'],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}