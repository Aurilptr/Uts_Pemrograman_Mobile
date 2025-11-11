# 🌟 Auril's Apps (UTS Pemrograman Mobile) 🌟

Aplikasi ini dibuat untuk memenuhi Ujian Tengah Semester mata kuliah Pemrograman Mobile.

---

## 🧑‍🎓 Identitas

* **Nama:** Auril Putri Amanda
* **NIM:** 15-2023-023
* **Kelas:** AA
* **Program Studi:** S1 - Informatika

---

## 🏛️ Arsitektur & Fitur Aplikasi

Aplikasi ini dibangun menggunakan arsitektur `BottomNavigationBar` sebagai navigasi utama. Setiap halaman (Biodata, Kontak, Kalkulator, Cuaca, Berita) dimuat menggunakan konsep `Fragment` (Widget) untuk memastikan aplikasi tetap ringan dan efisien.

## 📸 Paparan Screenshot dan Fitur

Berikut adalah deskripsi dan tampilan dari aplikasi yang telah dibuat :

### 1. Splash Screen
Halaman ini adalah *splash screen* yang muncul selama 5 detik.
* Menampilkan Judul Aplikasi: `Auril's Apps` (dengan font kustom "Pacifico").
* Menampilkan Foto Profil.
* Menampilkan NIM: `15-2023-023`
* Menampilkan Nama: `Auril Putri Amanda`
* Dilengkapi hiasan ikon-ikon lucu di *background* yang diatur menggunakan `Stack`.

<img src="https://github.com/Aurilptr/Uts_Pemrograman_Mobile/blob/main/SPLASH.jpg?raw=true" width="300" />

---
### 2. Halaman Biodata
Halaman ini menampilkan profil dan formulir data diri. Halaman ini fungsional dan berisi berbagai komponen input:
* Informasi Teks dan Foto Profil.
* Input Teks (`TextFormField`) untuk Email, No. Handphone, dan Alamat Domisili.
* Dropdown (`DropdownButtonFormField`) untuk memilih Program Studi.
* Radio Button (`RadioListTile`) untuk memilih Jenis Kelamin.
* Pemilih Tanggal (`showDatePicker`) yang menampilkan kalender.

<b>Biodata (Bagian Atas)</b>
<br>
<img src="https://github.com/Aurilptr/Uts_Pemrograman_Mobile/blob/main/BIODATA_1.jpg?raw=true" width="300" />
<br><br>
<b>Biodata (Bagian Bawah)</b>
<br>
<img src="https://github.com/Aurilptr/Uts_Pemrograman_Mobile/blob/main/BIODATA_2.jpg?raw=true" width="300" />

---
### 3. Halaman Kontak
Halaman ini menampilkan daftar 15 kontak yang datanya diambil secara statis dari *list* variabel (model `Contact`).
* Menggunakan `ListView.builder` untuk menampilkan data secara efisien.
* Setiap *item* dalam daftar menggunakan `ListTile` yang berisi `CircleAvatar` untuk gambar dan Teks untuk Nama & Nomor HP.

<img src="https://github.com/Aurilptr/Uts_Pemrograman_Mobile/blob/main/KONTAK.jpg?raw=true" width="300" />

---
### 4. Halaman Kalkulator
Halaman ini adalah kalkulator sederhana yang fungsional. Sesuai petunjuk, kalkulator ini mendukung:
* Operasi dasar: Tambah (+), Kurang (-), Kali (×), Bagi (÷).
* Operasi tambahan: Persentase (%), Kuadrat (x²), dan Akar Kuadrat (√).
* Tombol `C` (Clear) untuk menghapus semua input.
* Tombol `DEL` (Backspace) untuk menghapus satu per satu.
* Menggunakan *package* `math_expressions` untuk melakukan kalkulasi.

<img src="https://github.com/Aurilptr/Uts_Pemrograman_Mobile/blob/main/KALKULATOR.jpg?raw=true" width="300" />

---
### 5. Halaman Cuaca
Halaman ini menampilkan data cuaca statis.
* Menggunakan animasi Lottie (`Lottie.asset`) untuk menampilkan kondisi cuaca (cerah) secara visual.
* Menampilkan informasi utama: Lokasi, Suhu, dan Kondisi Cuaca.
* Menampilkan `ListView` horizontal yang bisa di-*scroll* untuk Prediksi Per Jam (24 Jam).
* Menampilkan `GridView` untuk Detail Cuaca Tambahan (Kelembapan, Angin, Indeks UV, Terasa Seperti).

<b>Cuaca (Bagian Atas)</b>
<br>
<img src="https://github.com/Aurilptr/Uts_Pemrograman_Mobile/blob/main/CUACA_1.jpg?raw=true" width="300" />
<br><br>
<b>Cuaca (Bagian Bawah)</b>
<br>
<img src="https://github.com/Aurilptr/Uts_Pemrograman_Mobile/blob/main/CUACA_2.jpg?raw=true" width="300" />

---
### 6. Halaman Berita
Halaman ini menampilkan daftar berita statis. *layout* halaman ini memiliki pola tampilan berulang:
* Menggunakan `ListView.builder` yang diisi dengan `Card` agar tampilan rapi.
* Setiap *item* berita menampilkan Gambar Thumbnail, Sumber Berita, Judul, dan Deskripsi singkat.

<img src="https://github.com/Aurilptr/Uts_Pemrograman_Mobile/blob/main/BERITA.jpg?raw=true" width="300" />