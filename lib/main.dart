import 'package:flutter/material.dart';
import 'barang_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
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
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  String kataCari = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Menyaring barang berdasarkan stok dan kata pencarian
    final hasilCari = MyApp.daftarBarang
        .where((barang) => barang['stok'] > 0)
        .where(
          (barang) =>
              barang['nama'].toLowerCase().contains(kataCari),
        )
        .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Koperasi Sekolah'),
        ),

        body: Column(
          children: [
            // Kotak pencarian
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Cari barang...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataCari = nilai.toLowerCase();
                });
              },
            ),

            // Menampilkan lebar layar
            Text(
              'Lebar layar: '
              '${MediaQuery.of(context).size.width.toStringAsFixed(0)}',
            ),

            // Grid responsif
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int kolom;

                  if (constraints.maxWidth < 600) {
                    kolom = 1;
                  } else if (constraints.maxWidth < 900) {
                    kolom = 2;
                  } else {
                    kolom = 3;
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(4),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: kolom,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: hasilCari.length,
                    itemBuilder: (context, index) {
                      final barang = hasilCari[index];

                      return BarangCard(
                        nama: barang['nama'],
                        hargaAnggota: barang['anggota'],
                        stok: barang['stok'],
                        kategori: barang['kategori'],
                        sorot: barang['nama'] == 'Buku Tulis',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}