import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  final String _productsUrl =
      'http://flutter.masaku.my.id/produk.php'; // Ganti dengan URL PHP Anda

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_productsUrl));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

class Product {
  final String name;
  final String code;

  Product({required this.name, required this.code});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['nama_produk'],
      code: json['kode_produk'],
    );
  }
}
