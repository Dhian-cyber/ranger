import 'package:flutter/material.dart';
import 'scaffold_with_drawer.dart';

class MenuBaruScreenlama extends StatelessWidget {
  const MenuBaruScreenlama({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawer(
      body: const Center(
        child: Text('Menu Baru Screen'),
      ),
      appBar: AppBar(
        title: const Text('Menu Baru'),
      ),
      activeRoute: '/menu-baru',
    );
  }
}
