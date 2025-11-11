// lib/splash_screen.dart

import 'dart:async'; // Untuk timer
import 'dart:math'; // Untuk rotasi acak
import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Halaman tujuan kita

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer 5 detik
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Bikin semua hiasan jadi penuh
        children: [
          
          // --- LAPISAN 1: Hiasan Background Penuh & Rapi ---
          _buildBackgroundDecorations(),

          // --- LAPISAN 2: Konten Utama (Nama, Foto, dll) ---
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0), // Beri jarak dari tepi layar
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- Judul Aplikasi ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_outline_rounded, color: Colors.pink[300], size: 32),
                      const SizedBox(width: 10),
                      Text(
                        "Auril's Apps",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Color(0xFFE91E63),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.star_outline_rounded, color: Colors.pink[300], size: 30),
                    ],
                  ),
                  
                  const SizedBox(height: 40), // Jarak

                  // --- Foto Profil (Kotak Sudut Tumpul) ---
                  SizedBox(
                    width: 210, 
                    height: 300,
                    child: ClipRRect( 
                      borderRadius: BorderRadius.circular(30.0), 
                      child: Image.asset(
                        'assets/images/Photo_Profile.jpg',
                        fit: BoxFit.cover, 
                      ),
                    ),
                  // ==========================================================
                  // PERBAIKAN: Hapus satu koma di bawah ini
                  // ==========================================================
                  ), // <-- Hanya satu koma di sini
                  
                  const SizedBox(height: 30), // Jarak dirapikan

                  // --- NIM ---
                  Text(
                    "15-2023-023", 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // --- Nama ---
                  Text(
                    "Auril Putri Amanda", 
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER UNTUK HIASAN FULL BACKGROUND (LEBIH BANYAK & RAPI) ---
  Widget _buildBackgroundDecorations() {
    final iconColor = Colors.pink[100]!.withAlpha(102); 
    
    return Stack(
      children: [
        // Es Krim (kiri atas)
        Positioned(
          top: 60,
          left: 40,
          child: Transform.rotate(
            angle: -0.2 * pi, 
            child: Icon(Icons.icecream_outlined, size: 55, color: iconColor),
          ),
        ),
        
        // Kue (kanan atas)
        Positioned(
          top: 100,
          right: 30,
          child: Transform.rotate(
            angle: 0.1 * pi,
            child: Icon(Icons.cake_outlined, size: 40, color: iconColor),
          ),
        ),

        // Biskuit (tengah atas)
        Positioned(
          top: 30,
          left: MediaQuery.of(context).size.width / 2 - 20, 
          child: Transform.rotate(
            angle: 0.05 * pi,
            child: Icon(Icons.cookie_outlined, size: 45, color: iconColor),
          ),
        ),
        
        // Teddy Bear (kiri tengah)
        Positioned(
          top: 280,
          left: 10,
          child: Transform.rotate(
            angle: -0.15 * pi,
            child: Icon(Icons.toys_outlined, size: 50, color: iconColor),
          ),
        ),

        // Kupu-kupu/Bunga (kanan tengah)
        Positioned(
          top: 350,
          right: 10,
          child: Transform.rotate(
            angle: 0.1 * pi,
            child: Icon(Icons.filter_vintage_outlined, size: 40, color: iconColor),
          ),
        ),
        
        // Telapak Kaki (kiri bawah)
        Positioned(
          bottom: 150,
          left: 20,
          child: Transform.rotate(
            angle: 0.08 * pi,
            child: Icon(Icons.pets, size: 50, color: iconColor),
          ),
        ),

        // Awan (kanan bawah)
        Positioned(
          bottom: 80,
          right: 50,
          child: Transform.rotate(
            angle: -0.05 * pi,
            child: Icon(Icons.cloud_queue_rounded, size: 60, color: iconColor),
          ),
        ),

        // Bintang (tengah bawah)
        Positioned(
          bottom: 250,
          right: MediaQuery.of(context).size.width / 2 - 25, 
          child: Transform.rotate(
            angle: 0.1 * pi,
            child: Icon(Icons.star_border_rounded, size: 50, color: iconColor),
          ),
        ),

        // Hati kecil (pojok kiri bawah)
        Positioned(
          bottom: 30,
          left: 100,
          child: Transform.rotate(
            angle: -0.1 * pi,
            child: Icon(Icons.favorite_border, size: 30, color: iconColor),
          ),
        ),

        // Bunga kecil (pojok kanan atas)
        Positioned(
          top: 20,
          right: 180,
          child: Transform.rotate(
            angle: 0.15 * pi,
            child: Icon(Icons.local_florist_outlined, size: 30, color: iconColor),
          ),
        ),

        // Balon (tengah-tengah atas)
        Positioned(
          top: 200,
          left: MediaQuery.of(context).size.width * 0.4,
          child: Transform.rotate(
            angle: -0.1 * pi,
            child: Icon(Icons.flare_outlined, size: 40, color: iconColor), 
          ),
        ),

        // Coklat (pojok kanan tengah)
        Positioned(
          top: MediaQuery.of(context).size.height * 0.6,
          right: 20,
          child: Transform.rotate(
            angle: 0.07 * pi,
            child: Icon(Icons.cake, size: 35, color: iconColor),
          ),
        ),
      ],
    );
  }
}