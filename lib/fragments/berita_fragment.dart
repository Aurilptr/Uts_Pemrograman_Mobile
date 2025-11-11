// lib/fragments/berita_fragment.dart

import 'package:flutter/material.dart';
import '../models/news_model.dart'; // Panggil "cetakan" berita

class BeritaFragment extends StatelessWidget {
  BeritaFragment({super.key});

  // --- DATA STATIS BERITA (5 ITEM) ---
  final List<News> newsList = [
    News(
      source: "The Verge",
      title: "OpenAI announces platform for making custom ChatGPTs",
      description: "OpenAI has announced a new feature for creating custom AIs...",
      imageAsset: "assets/images/berita1.png", 
    ),
    News(
      source: "CNN",
      title: "The National Zoo's panda program is ending",
      description: "The three giant pandas are inbound in their enclosure...",
      imageAsset: "assets/images/berita2.jpg", 
    ),
    News(
      source: "Flutter Dev",
      title: "Flutter 3.20 Dirilis dengan Peningkatan Performa",
      description: "Update terbaru fokus pada rendering Impeller dan...",
      imageAsset: "assets/images/berita3.jpg", 
    ),
     News(
      source: "TechCrunch",
      title: "Startup AI Baru Mendapat Pendanaan \$100 Juta",
      description: "Sebuah startup AI yang fokus pada analisis data berhasil...",
      imageAsset: "assets/images/berita4.jpg", 
    ),
    News(
      source: "Wired",
      title: "Dampak Perubahan Iklim Terasa Lebih Cepat",
      description: "Para ilmuwan memperingatkan bahwa efek pemanasan global...",
      imageAsset: "assets/images/berita5.jpg", 
    ),
  ];
  // --- AKHIR DATA STATIS ---

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (BuildContext context, int index) {
        final news = newsList[index];
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card( 
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding( 
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero, 
                
                // Tampilan Teks (Source, Title, Description)
                title: Text(
                  news.source.toUpperCase(), 
                  style: const TextStyle(
                    color: Color(0xFFE91E63), 
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      news.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      news.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                // Tampilan Gambar (di Kanan)
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    news.imageAsset,
                    width: 80, // Ukuran gambar thumbnail
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}