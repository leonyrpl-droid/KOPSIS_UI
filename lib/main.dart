import 'package:flutter/material.dart'; // Mengimpor pustaka UI Flutter

void main() => runApp(const MyApp()); // Fungsi utama untuk menjalankan aplikasi

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Data barang koperasi
  static const List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40, 'kategori': 'ATK'},
    {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 25, 'kategori': 'ATK'},
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
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];

            // Menentukan ikon berdasarkan kategori
            IconData ikon;

            if (barang['kategori'] == 'ATK') {
              ikon = Icons.edit;
            } else if (barang['kategori'] == 'Makanan') {
              ikon = Icons.fastfood;
            } else {
              ikon = Icons.local_drink;
            }

            // Card digunakan untuk menampilkan informasi barang
            return Card(
              // Memberikan jarak 12 piksel dari tepi layar
              margin: const EdgeInsets.all(12),

              // Memberikan bayangan pada Card
              elevation: 4,

              // ListTile menyusun informasi barang dengan lebih rapi
              child: ListTile(
                // Ikon barang di sebelah kiri
                leading: Icon(ikon),

                // Nama barang dibuat lebih besar dan tebal
                title: Text(
                  barang['nama'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Menampilkan harga anggota dan harga umum
                subtitle: Text(
                  'Anggota Rp${barang['anggota']} | Umum Rp${barang['umum']}',
                ),

                // Menampilkan jumlah stok di sebelah kanan
                trailing: Text(
                  'Stok ${barang['stok']}',
                  style: TextStyle(
                    color: barang['stok'] == 0
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}