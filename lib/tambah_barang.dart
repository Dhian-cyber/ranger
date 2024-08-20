import 'package:flutter/material.dart';
import 'scaffold_with_drawer.dart';

class TambahBarangScreen extends StatelessWidget {
  const TambahBarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawer(
      appBar: AppBar(
        title: const Text('Tambah Barang'),
      ),
      body: const Center(
        child: Text('Tambah Barang Screen'),
      ),
      activeRoute: '/tambah-barang',
    );
  }
}
