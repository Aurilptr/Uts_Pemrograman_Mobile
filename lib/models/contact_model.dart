// lib/models/contact_model.dart

class Contact {
  final String name;
  final String phone;
  final String imageAsset; // Path ke gambar aset kita

  Contact({
    required this.name,
    required this.phone,
    required this.imageAsset,
  });
}