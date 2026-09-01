import 'package:flutter/material.dart';

import 'keranjang_item.dart';

class BarangCard extends StatefulWidget {
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
  State<BarangCard> createState() => _BarangCardState();
}

class _BarangCardState extends State<BarangCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: widget.sorot ? Colors.yellow.shade100 : null,
      child: ListTile(
        leading: const Icon(Icons.inventory_2),
        title: Text(widget.nama),
        subtitle: Text(
          'Anggota Rp${widget.hargaAnggota} | ${widget.kategori}',
        ),
        trailing: KeranjangItem(
          stok: widget.stok,
          harga: widget.hargaAnggota,
        ),
      ),
    );
  }
}