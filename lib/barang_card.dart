import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final int hargaAnggota;
  final int stok;
  final String kategori;
  final bool sorot;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.stok,
    required this.kategori,
    this.sorot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: sorot ? Colors.yellow.shade100 : null,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Ikon barang
            const Icon(
              Icons.inventory_2,
              size: 28,
            ),

            const SizedBox(width: 10),

            // Nama, harga, dan kategori
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp$hargaAnggota | $kategori',
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Tombol jumlah
            KeranjangItem(
              stok: stok,
              harga: hargaAnggota,
            ),
          ],
        ),
      ),
    );
  }
}