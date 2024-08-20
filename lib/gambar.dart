import 'package:flutter/material.dart';
import 'scaffold_with_drawer.dart';

class GambarScreen extends StatelessWidget {
  const GambarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String imageUrl = 'assets/images/download.jpg';

    return ScaffoldWithDrawer(
      appBar: AppBar(
        title: const Text('Gambar'),
      ),
      body: Center(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      activeRoute: '/gambar',
    );
  }
}
