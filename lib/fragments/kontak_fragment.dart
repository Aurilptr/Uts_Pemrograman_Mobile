// lib/fragments/kontak_fragment.dart

import 'package:flutter/material.dart';
import '../models/contact_model.dart'; 

class KontakFragment extends StatelessWidget {
   KontakFragment({super.key});

  final List<Contact> contacts = [
    Contact(name: "Alya Nuraini", phone: "081234567890", imageAsset: "assets/images/cewek.png"),
    Contact(name: "Budi Santoso", phone: "081122334455", imageAsset: "assets/images/cowok.png"),
    Contact(name: "Citra Lestari", phone: "081987654321", imageAsset: "assets/images/cewek.png"),
    Contact(name: "Dodi Firmansyah", phone: "081555667788", imageAsset: "assets/images/cowok.png"),
    Contact(name: "Elisa Putri", phone: "081777889900", imageAsset: "assets/images/cewek.png"),
    Contact(name: "Fajar Nugroho", phone: "081222333444", imageAsset: "assets/images/cowok.png"),
    Contact(name: "Gita Permata", phone: "081333444555", imageAsset: "assets/images/cewek.png"),
    Contact(name: "Hadi Prabowo", phone: "081444555666", imageAsset: "assets/images/cowok.png"),
    Contact(name: "Indah Cahyani", phone: "081555666777", imageAsset: "assets/images/cewek.png"),
    Contact(name: "Joko Susilo", phone: "081666777888", imageAsset: "assets/images/cowok.png"),
    Contact(name: "Kania Dewi", phone: "081777888999", imageAsset: "assets/images/cewek.png"),
    Contact(name: "Lila Wulandari", phone: "081888999000", imageAsset: "assets/images/cewek.png"),
    Contact(name: "Mega Anggraini", phone: "081999000111", imageAsset: "assets/images/cewek.png"),
    Contact(name: "Nanda Saputra", phone: "081211223344", imageAsset: "assets/images/cowok.png"),
    Contact(name: "Oscar Mahendra", phone: "081311223355", imageAsset: "assets/images/cowok.png"),
    Contact(name: "Putri Amelia", phone: "081411223366", imageAsset: "assets/images/cewek.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = contacts[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(contact.imageAsset),
                backgroundColor: Colors.pink[50],
              ),
              title: Text(
                contact.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              subtitle: Text(contact.phone, style: const TextStyle(fontSize: 14, color: Colors.black54)),
              trailing: const Icon(Icons.phone, color: Color(0xFFF48FB1)),
            ),
          ),
        );
      },
    );
  }
}
