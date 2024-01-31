import 'package:flutter/material.dart';

class TentangKamiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(146, 146, 189, 1),
        title: Text('Tentang Kami'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], // Ganti warna background sesuai keinginan
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat datang di Aplikasi Kami!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Aplikasi ini dibuat oleh tim pengembang yang berdedikasi untuk memberikan pengalaman yang luar biasa kepada pengguna, diharapkan aplikasi ini mampu mendeteksi jenis-jenis kendaraan didarat serta dapat menghitung jumlahnya.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Fitur Utama:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '- Mulai Deteksi: Fitur untuk memulai proses deteksi tertentu.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Chatbot: Fitur yang memungkinkan pengguna berinteraksi dengan asisten virtual.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- LogOut: Fitur untuk keluar dari aplikasi.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Hubungi Kami:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Email: arifsamiaji11@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Telepon: 087797741817',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TentangKamiPage(),
  ));
}
