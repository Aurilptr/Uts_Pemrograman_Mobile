// lib/fragments/biodata_fragment.dart

import 'package:flutter/material.dart';

class BiodataFragment extends StatefulWidget {
  const BiodataFragment({super.key});

  @override
  State<BiodataFragment> createState() => _BiodataFragmentState();
}

class _BiodataFragmentState extends State<BiodataFragment> {
  // === 1. TAMBAHKAN CONTROLLER BARU ===
  String? _selectedProdi;
  String? _jenisKelamin;
  DateTime? _selectedDate;
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _noHpController = TextEditingController(); 


  final List<String> _prodiOptions = [
    'S1 - Informatika',
    'S1 - Sistem Informasi',
    'S1 - Teknik Elektro',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFE91E63),
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFE91E63),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    // === 2. BERSIHKAN CONTROLLER BARU ===
    _alamatController.dispose();
    _emailController.dispose(); 
    _noHpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        // --- FOTO PROFIL & NAMA ---
        _buildProfileHeader(),
        
        const SizedBox(height: 24),
        const Divider(color: Colors.pinkAccent),
        const SizedBox(height: 16),

        // --- 3. TAMBAHKAN TEXTFIELD BARU DI SINI ---
        
        // Input Teks (Email)
        _buildTextField(
          controller: _emailController,
          label: "Email",
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress, 
        ),

        const SizedBox(height: 20),

        // Input Teks (No. HP)
        _buildTextField(
          controller: _noHpController,
          label: "No. Handphone",
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),

        const SizedBox(height: 20),
        
        // Input Teks (Alamat)
        _buildTextField(
          controller: _alamatController,
          label: "Alamat Domisili",
          icon: Icons.home_outlined,
        ),

        const SizedBox(height: 20),

        // Dropdown (Program Studi)
        _buildDropdown(),

        const SizedBox(height: 20),
        
        // Radio Button (Jenis Kelamin)
        _buildRadioButtons(),

        const SizedBox(height: 20),
        
        // Kalender (Tanggal Lahir)
        _buildDatePicker(context),
        
        const SizedBox(height: 40),

        // Tombol Simpan
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data berhasil diperbarui!'),
                backgroundColor: Color(0xFFF48FB1),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            "Update Profil",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // --- WIDGET HELPER BIAR RAPI ---

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: const AssetImage('assets/images/Photo_Profile.jpg'), 
          backgroundColor: Colors.pink[50],
        ),
        const SizedBox(height: 16),
        const Text(
          "Auril Putri Amanda", 
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "15-2023-023",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFE91E63), // Pink
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // --- 4. UPDATE HELPER TEXTFIELD BIAR BISA GANTI KEYBOARD ---
  Widget _buildTextField({
    required TextEditingController controller, 
    required String label, 
    required IconData icon,
    TextInputType keyboardType = TextInputType.text, 
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFF48FB1)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE91E63)),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedProdi,
      hint: const Text("Pilih Program Studi"),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.school_outlined, color: const Color(0xFFF48FB1)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE91E63)),
        ),
      ),
      items: _prodiOptions.map((String prodi) {
        return DropdownMenuItem<String>(
          value: prodi,
          child: Text(prodi),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedProdi = newValue;
        });
      },
    );
  }

  Widget _buildRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Jenis Kelamin",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        RadioListTile<String>(
          title: const Text("Laki-laki"),
          value: "Laki-laki",
          groupValue: _jenisKelamin,
          onChanged: (String? value) {
            setState(() {
              _jenisKelamin = value;
            });
          },
          activeColor: const Color(0xFFE91E63),
        ),
        RadioListTile<String>(
          title: const Text("Perempuan"),
          value: "Perempuan",
          groupValue: _jenisKelamin,
          onChanged: (String? value) {
            setState(() {
              _jenisKelamin = value;
            });
          },
          activeColor: const Color(0xFFE91E63),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    String formattedDate = _selectedDate == null
        ? "Pilih Tanggal Lahir"
        : "${_selectedDate!.day} ${_getMonthName(_selectedDate!.month)} ${_selectedDate!.year}";

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: const Icon(Icons.calendar_today_outlined, color: Color(0xFFF48FB1)),
        title: Text(formattedDate),
        trailing: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        onTap: () => _selectDate(context),
      ),
    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    return monthNames[month - 1];
  }
}