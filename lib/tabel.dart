import 'package:flutter/material.dart';
import 'scaffold_with_drawer.dart';
import 'product_service.dart'; // Import ProductService

class TabelScreen extends StatefulWidget {
  const TabelScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabelScreenState createState() => _TabelScreenState();
}

class _TabelScreenState extends State<TabelScreen> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products =
        ProductService().fetchProducts(); // Ambil data produk saat inisialisasi
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawer(
      appBar: AppBar(
        title: const Text('Tabel'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available'));
          }

          final products = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical, // Scroll vertikal
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll horizontal
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('No')),
                  DataColumn(label: Text('Code')),
                  DataColumn(label: Text('Name')),
                ],
                rows: products.asMap().entries.map((entry) {
                  int index = entry.key;
                  Product product = entry.value;

                  return DataRow(
                    cells: [
                      DataCell(Text((index + 1).toString())), // Nomor urut
                      DataCell(Text(product.code)), // Kode
                      DataCell(Text(product.name)), // Nama
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
      activeRoute: '/tabel',
    );
  }
}
