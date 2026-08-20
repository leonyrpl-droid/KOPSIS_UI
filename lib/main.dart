import 'package:flutter/material.dart'; // Mengimpor pustaka UI Flutter

void main() => runApp(const MyApp()); // Fungsi utama untuk menjalankan aplikasi

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final int stok = 40;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Menampilkan bar judul di bagian atas layar
        appBar: AppBar(
          title: const Text('Koperasi Sekolah'),
        ),

        // Card digunakan untuk menampilkan informasi barang
        body: Card(
          // Memberikan jarak 12 piksel dari tepi layar
          margin: const EdgeInsets.all(12),

          // ListTile menyusun informasi barang dengan lebih rapi
          child: ListTile(
            // Ikon barang di sebelah kiri
            leading: const Icon(Icons.inventory_2),

            // Nama barang dibuat lebih besar dan tebal
            title: const Text(
              'Buku Tulis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Menampilkan harga anggota dan harga umum
            subtitle: const Text(
              'Anggota Rp3.000 | Umum Rp3.500',
            ),

            // Menampilkan jumlah stok di sebelah kanan
            trailing: Text(
              'Stok ' + stok.toString(),
              style: TextStyle(
                color: stok == 0 ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}