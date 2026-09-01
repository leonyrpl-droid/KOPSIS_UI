import 'package:flutter/material.dart'; // Mengimpor pustaka UI Flutter
import 'barang_card.dart'; // Mengimpor komponen BarangCard

void main() => runApp(const MyApp()); // Fungsi utama untuk menjalankan aplikasi

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Data barang koperasi
  static const List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40, 'kategori': 'ATK'},
    {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 0, 'kategori': 'ATK'},
    {'nama': 'Roti', 'anggota': 5000, 'umum': 5500, 'stok': 15, 'kategori': 'Makanan'},
    {'nama': 'Pensil', 'anggota': 2000, 'umum': 2500, 'stok': 30, 'kategori': 'ATK'},
    {'nama': 'Penghapus', 'anggota': 1500, 'umum': 2000, 'stok': 20, 'kategori': 'ATK'},
    {'nama': 'Buku Gambar', 'anggota': 4000, 'umum': 4500, 'stok': 18, 'kategori': 'ATK'},
    {'nama': 'Spidol', 'anggota': 3500, 'umum': 4000, 'stok': 12, 'kategori': 'ATK'},
    {'nama': 'Air Mineral', 'anggota': 3000, 'umum': 3500, 'stok': 25, 'kategori': 'Minuman'},
    {'nama': 'Biskuit', 'anggota': 4000, 'umum': 4500, 'stok': 10, 'kategori': 'Makanan'},
    {'nama': 'Pensil Warna', 'anggota': 7000, 'umum': 7500, 'stok': 8, 'kategori': 'ATK'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Menampilkan bar judul di bagian atas layar
        appBar: AppBar(
          title: const Text('Koperasi Sekolah'),
        ),

        // Menampilkan daftar barang menggunakan ListView.builder
        body: ListView.builder(
          // Hanya menampilkan barang yang stoknya masih ada
          itemCount: daftarBarang
              .where((barang) => barang['stok'] > 0)
              .length,

          itemBuilder: (context, index) {
            // Mengambil barang yang stoknya masih ada
            final barang = daftarBarang
                .where((barang) => barang['stok'] > 0)
                .toList()[index];

            // Memanggil komponen BarangCard
            return BarangCard(
              nama: barang['nama'],
              hargaAnggota: barang['anggota'],
              stok: barang['stok'],
              kategori: barang['kategori'],
              sorot: barang['nama'] == 'Buku Tulis',
            );
          },
        ),
      ),
    );
  }
}